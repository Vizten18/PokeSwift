//
//  PokemonListViewModel.swift
//  PokeSwift
//
//  Created by Vicente Herrera on 11/1/26.
//

import Foundation

@MainActor
class PokemonListViewModel: ObservableObject {

    @Published var pokemons: [Pokemon] = []
    @Published var isLoading: Bool = false

    private let repository: PokemonRepository
    private var currentOffset = 0
    private let limit = 20
    private var canLoadMore = true

    init(repository: PokemonRepository) {
        self.repository = repository
    }

    func loadPokemons() async{
        guard !isLoading && canLoadMore else { return }

        isLoading = true

        do {
            let pokemonList = try await repository.fetchPokemonList(offset: currentOffset, limit: limit)
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

}
