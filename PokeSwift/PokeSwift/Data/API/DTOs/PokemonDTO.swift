//
//  PokemonDTO.swift
//  PokeSwift
//
//  Created by Vicente Herrera on 10/1/26.
//

import Foundation

struct PokemonDTO: Codable {

    var id: Int? {
        return Int(url.split(separator: "/").last?.description ?? "0")

    }

    var imageUrl: URL? {
        return URL(
            string:
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id ?? 0).png"
        )

    }

    let name: String
    let url: String
    
    func toEntity() -> Pokemon {
        return Pokemon(
            id: id ?? 0,
            name: name,
            imageUrl: imageUrl
        )   
    }
 
}
