//
//  PokemonDetailViewModel.swift
//  PokeSwift
//
//  Created by Vicente Herrera on 11/1/26.
//

import Foundation

@MainActor
class PokemonDetailViewModel: ObservableObject {
    @Published var pokemon: Pokemon?
    @Published var isLoading: Bool = false

    private let repository: PokemonRepository
    private let pokemonID: Int

    init(repository: PokemonRepository, pokemonID: Int) {
        self.repository = repository
        self.pokemonID = pokemonID
    }

    func loadPokemonDetail() async {
        guard !isLoading else { return }

        isLoading = true

        do {
            self.pokemon = try await repository.getPokemonDetail(id: pokemonID)
        } catch {
            print("Error loading pokemon detail: \(error)")
        }
        isLoading = false
    }
}
