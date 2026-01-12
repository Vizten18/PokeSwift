//
//  View+InfinityFrame.swift
//  PokeSwift
//
//  Created by Vicente Herrera on 12/1/26.
//

import SwiftUI

extension View {
    func infinityFrame() -> some View {
        frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

