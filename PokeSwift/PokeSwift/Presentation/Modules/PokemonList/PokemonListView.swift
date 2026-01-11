//
//  PokemonListView.swift
//  PokeSwift
//
//  Created by Vicente Herrera on 11/1/26.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var viewModel: PokemonListViewModel

    let container: DependecyContainer

    var body: some View {
        NavigationStack {
            pokemonList
        }
    }

}

extension PokemonListView {
    fileprivate var pokemonList: some View {
        List(viewModel.pokemons) { pokemon in
            NavigationLink(value: pokemon.id) {
                HStack {
                    AsyncImage(url: pokemon.imageUrl) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 60, height: 60)

                    Text(pokemon.name.capitalized)
                        .font(.headline)
                }
            }
            .onAppear {
                if pokemon.id == viewModel.pokemons.last?.id {
                    Task { await viewModel.loadPokemons() }
                }
            }
        }
        .navigationTitle("PokeSwift")
        .navigationDestination(for: Int.self) { pokemonId in
            container.makePokemonDetailView(id: pokemonId)
        }
        .task {
            if viewModel.pokemons.isEmpty {
                await viewModel.loadPokemons()
            }
        }
        .overlay {
            if viewModel.isLoading && viewModel.pokemons.isEmpty {
                ProgressView("Loading Pokémons...")
            }
        }
        .refreshable {
            await viewModel.loadPokemons()
        }

    }
}

#Preview {
    let container = DependecyContainer()

    return container.makePokemonListView()

}
