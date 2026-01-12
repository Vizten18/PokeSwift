//
//  PokemonRow.swift
//  PokeSwift
//
//  Created by Vicente Herrera on 12/1/26.
//

import SwiftUI

struct PokemonRow: View {
    var pokemon: Pokemon
    let onAppearAction: () -> Void
    
    var body: some View {
        NavigationLink(value: pokemon.id) {
            VStack(spacing: 0) {
                HStack(spacing: 16) {
                    AsyncImage(url: pokemon.imageUrl) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 60, height: 60)

                    Text(pokemon.name.capitalized)
                        .font(.headline)
                        .foregroundColor(.primary)

                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding()
                .frame(maxWidth: .infinity)
                Divider()
                    .padding(.leading, 16)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .onAppear {
            onAppearAction()
        }
    }
}
