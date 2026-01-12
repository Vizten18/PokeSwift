//
//  View+Skeleton.swift
//  PokeSwift
//
//  Created by Vicente Herrera on 12/1/26.
//

import SwiftUI

struct Skeleton: ViewModifier {
    @State private var phase: CGFloat = 0
    var isLoading: Bool

    func body(content: Content) -> some View {
        if isLoading {
            content
                .redacted(reason: .placeholder) 
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            .clear, .white.opacity(0.4), .clear,
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .scaleEffect(x: 2)
                    .offset(x: phase)
                    .mask(content)
                )
                .onAppear {
                    withAnimation(
                        .linear(duration: 1.5).repeatForever(
                            autoreverses: false)
                    ) {
                        phase = 400
                    }
                }
        } else {
            content
        }
    }
}

extension View {
    func skeleton(if isLoading: Bool) -> some View {
        modifier(Skeleton(isLoading: isLoading))
    }
}

#Preview {
    VStack {
        Text("Hello, World!").padding()
            .skeleton(if: true)
    }
}
