//
//  PokeEndpoint.swift
//  PokeSwift
//
//  Created by Vicente Herrera on 11/1/26.
//

import Foundation

enum PokeEndpoint {
    case list(offset: Int, limit: Int)
    case detail(id: Int)

    func url(config: APIConfig) -> URL? {
        switch self {
        case .list(let offset, let limit):
            return URL(string:"\(config.baseUrl)/pokemon?offset=\(offset)&limit=\(limit)")
        case .detail(let id):
            return URL(string: "\(config.baseUrl)/pokemon/\(id)")
        }
    }
}
