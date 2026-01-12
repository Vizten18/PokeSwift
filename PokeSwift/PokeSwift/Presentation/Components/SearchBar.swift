//
//  SearchBar.swift
//  PokeSwift
//
//  Created by Vicente Herrera on 12/1/26.
//

import SwiftUI

struct SearchBar: View {

    let placeholder: String
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField(placeholder, text: $text)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                    .padding()
                        .offset(x: 10)
                        .foregroundColor(.gray.opacity(0.3))
                        .opacity(text.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            text = ""
                        }, alignment: .trailing
                )

        }
    }
}

#Preview {
    SearchBar(placeholder: "Search Pokemon", text: .constant(""))
        .infinityFrame()
        .background(Color.white)
}
