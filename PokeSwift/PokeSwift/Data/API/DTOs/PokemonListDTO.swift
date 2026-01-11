//
//  PokemonListDTO.swift
//  PokeSwift
//
//  Created by Vicente Herrera on 10/1/26.
//

import Foundation

struct PokemonListDTO : Codable {
    let results : [PokemonDTO]
    
    func toEntity() -> [Pokemon] {
        return results.map { $0.toEntity() }
    }
}
