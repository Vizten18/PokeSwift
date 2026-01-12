//
//  Pokemon.swift
//  PokeSwift
//
//  Created by Vicente Herrera on 10/1/26.
//

import Foundation

struct Pokemon: Identifiable {
    let id: Int
    let name: String
    let imageUrl: URL?
    
}

extension Pokemon {
    static func empty() -> Pokemon {
        return Pokemon(id: 0, name: "", imageUrl: nil)
    }
}
