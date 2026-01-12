//
//  PokemonRepository.swift
//  PokeSwift
//
//  Created by Vicente Herrera on 11/1/26.
//

import Foundation

protocol PokemonRepository {
    func fetchPokemonList(offset: Int, limit: Int) async throws -> PokemonList
    func getPokemonDetail(id: Int) async throws -> Pokemon
    func searchPokemonByName(name: String) async throws -> Pokemon
}
