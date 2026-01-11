//
//  PokemonDetailView.swift
//  PokeSwift
//
//  Created by Vicente Herrera on 11/1/26.
//

import SwiftUI

struct PokemonDetailView: View {
    @StateObject var viewModel: PokemonDetailViewModel

    var body: some View {
        VStack {
            pokemonImage
            title
        }
        .task {
            await viewModel.loadPokemonDetail()
        }
    }
}

extension PokemonDetailView {
    var pokemonImage: some View {
        AsyncImage(url: viewModel.pokemon?.imageUrl) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        } placeholder: {
            ProgressView()
        }
    }
    var title: some View {
        Text(viewModel.pokemon?.name.capitalized ?? "Loading...")
    }
}

#Preview {
    let container = DependecyContainer()
    container.makePokemonDetailView(id: 1)
}
