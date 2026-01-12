//
//  PokemonRepositoryImpl.swift
//  PokeSwift
//
//  Created by Vicente Herrera on 11/1/26.
//

import Foundation

final class PokemonRepositoryImpl: PokemonRepository {

    private let config: APIConfig

    init(config: APIConfig) {
        self.config = config
    }

    func fetchPokemonList(offset: Int, limit: Int) async throws -> PokemonList {
        guard
            let url = PokeEndpoint.list(offset: offset, limit: limit).url(
                config: config)
        else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let dto = try JSONDecoder().decode(PokemonListDTO.self, from: data)

        return PokemonList(results: dto.toEntity())
    }

    func getPokemonDetail(id: Int) async throws -> Pokemon {
        guard let url = PokeEndpoint.detail(id: id).url(config: config)
        else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let dto = try JSONDecoder().decode(PokemonDetailDTO.self, from: data)

        return dto.toEntity()

    }

    func searchPokemonByName(name: String) async throws -> Pokemon {
        guard let url = PokeEndpoint.search(name: name).url(config: config)
        else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let dto = try JSONDecoder().decode(PokemonDetailDTO.self, from: data)

        return dto.toEntity()
    }

}
