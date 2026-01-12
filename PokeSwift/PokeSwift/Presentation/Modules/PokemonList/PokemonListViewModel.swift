//
//  PokemonListViewModel.swift
//  PokeSwift
//
//  Created by Vicente Herrera on 11/1/26.
//

import Combine
import Foundation

@MainActor
class PokemonListViewModel: ObservableObject {

    @Published var pokemons: [Pokemon] = []
    @Published var searchedPokemon: Pokemon
    @Published var isLoading: Bool = false
    @Published var isSearching: Bool = false

    @Published var searchText: String = ""

    private let repository: PokemonRepository
    private var currentOffset = 0
    private let limit = 20
    private var canLoadMore = true
    private var cancellables = Set<AnyCancellable>()

    init(repository: PokemonRepository) {
        self.repository = repository
        
        self.searchedPokemon = Pokemon.empty()
        setupSearch()
    }

    private func setupSearch() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                Task {
                    await self?.searchPokemon(query: text)
                }
            }
            .store(in: &cancellables)
    }
    
    func loadPokemons() async {
        guard !isLoading && canLoadMore else { return }

        isLoading = true

        do {
            let pokemonList = try await repository.fetchPokemonList(
                offset: currentOffset, limit: limit)
            if pokemonList.results.isEmpty {
                canLoadMore = false
            } else {
                pokemons.append(contentsOf: pokemonList.results)
                currentOffset += limit
            }
        } catch {
            print("Error loading pokemons: \(error)")
        }
        isLoading = false

    }

    func searchPokemon(query: String) async {
        guard !query.isEmpty else {
            self.isSearching = false
            self.searchedPokemon = .empty()
            return
        }

        isSearching = true

        do {
            self.searchedPokemon = try await repository.searchPokemonByName(name: query.lowercased())
            isSearching = false 
        } catch {
            self.searchedPokemon = .empty()
            isSearching = false
        }
    }
}
