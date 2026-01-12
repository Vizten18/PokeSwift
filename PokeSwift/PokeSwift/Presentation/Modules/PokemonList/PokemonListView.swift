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
            VStack(spacing: 16) {
                SearchBar(
                    placeholder: "Search Pokemon", text: $viewModel.searchText
                )
                .padding(.horizontal)

            }
            ScrollView {
                LazyVStack(spacing: 0) {
                    if !viewModel.searchText.isEmpty {
                        pokemonFounded
                        Divider().padding(.vertical)
                    }
                    mainListContent
                }
            }
            .navigationTitle("PokeSwift")
            .navigationDestination(for: Int.self) { pokemonId in
                container.makePokemonDetailView(id: pokemonId)
            }
            .refreshable {
                await viewModel.loadPokemons()
            }
            .task {
                if viewModel.pokemons.isEmpty {
                    await viewModel.loadPokemons()
                }
            }
        }
    }
}

extension PokemonListView {
    @ViewBuilder
    fileprivate var mainListContent: some View {
        headerTitle

        ForEach(viewModel.pokemons) { pokemon in
            PokemonRow(pokemon: pokemon) {
                if pokemon.id == viewModel.pokemons.last?.id {
                    Task { await viewModel.loadPokemons() }
                }
            }

        }

        if viewModel.isLoading && !viewModel.pokemons.isEmpty {
            ProgressView()
                .frame(maxWidth: .infinity)
                .padding()
        }
    }

    var pokemonFounded: some View {
        let searchTitleText =
            viewModel.searchedPokemon.name.isEmpty
            ? "No Pokemon Found" : "Pokemon Found"

        return VStack(alignment: .leading, spacing: 0) {
            Text(searchTitleText)
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()

            PokemonRow(pokemon: viewModel.searchedPokemon) {}
                .skeleton(if: viewModel.isSearching)
        }
    }

    private var headerTitle: some View {
        Text("Total Pokémons: \(viewModel.pokemons.count)")
            .font(.title2)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }

}

#Preview {
    let container = DependecyContainer()

    return container.makePokemonListView()

}
