//
//  APIConfig.swift
//  PokeSwift
//
//  Created by Vicente Herrera on 11/1/26.
//

import Foundation

protocol APIConfig {
    var baseUrl: String { get }
}

struct PokeAPIConfig: APIConfig {
    var baseUrl: String

    init() {
        self.baseUrl = "https://pokeapi.co/api/v2"
    }
}
