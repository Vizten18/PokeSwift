//
//  DependecyContainer.swift
//  PokeSwift
//
//  Created by Vicente Herrera on 11/1/26.
//

import Foundation

final class DependecyContainer: ObservableObject {
    private let config = PokeAPIConfig()

    private lazy var pokemonRepository: PokemonRepository = {
        PokemonRepositoryImpl(config: config)
    }()

    @MainActor
    func makePokemonListView() -> PokemonListView {
        let viewModel = PokemonListViewModel(repository: pokemonRepository)
        return PokemonListView(viewModel: viewModel, container: self)
    }

    @MainActor
    func makePokemonDetailView(id: Int) -> PokemonDetailView {
        let viewModel = PokemonDetailViewModel(
            repository: pokemonRepository,
            pokemonID: id
        )
        return PokemonDetailView(viewModel: viewModel)
    }
}
