//
//  PokemonDetailDTO.swift
//  PokeSwift
//
//  Created by Vicente Herrera on 11/1/26.
//

import Foundation

struct PokemonDetailDTO: Codable {
    let id: Int
    let name: String
    let sprites: SpritesDTO
    
    struct SpritesDTO: Codable {
        let front_default: String
    }
    
    func toEntity() -> Pokemon {
        return Pokemon(
            id: id,
            name: name,
            imageUrl: URL(string: sprites.front_default)
        )
    }
}
