//
//  PokeSwiftApp.swift
//  PokeSwift
//
//  Created by Vicente Herrera on 10/1/26.
//

import SwiftUI

@main
struct PokeSwiftApp: App {
    let container  = DependecyContainer()
    var body: some Scene {
        WindowGroup {
            container.makePokemonListView()
        }
    }
}
