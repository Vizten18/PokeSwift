//
//  View+InputTextField.swift
//  PokeSwift
//
//  Created by Vicente Herrera on 12/1/26.
//

import SwiftUI

extension View {
    func inputTextField() -> some View {
        self
            .keyboardType(.default)
            .padding(12)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

