//
//  ContentView.swift
//  ParallaxScrollView
//
//  Created by Christopher Gonzalez on 2024-07-31.
//

import SwiftUI

struct ContentView: View {
    let imageName = ["building 1", "building 2", "building 3", "building 4", "building 5", "building 6", "building 7",]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 16) {
                ForEach(imageName, id: \.self) { imageName in
                    VStack {
                        ZStack {
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .scrollTransition(axis: .horizontal) { content, phase in
                                    content
                                        .offset(x: phase.isIdentity ? 0 : phase.value * -200)
                                }
                        }
                        .containerRelativeFrame(.horizontal)
                        .clipShape(RoundedRectangle(cornerRadius: 36))
                        .shadow(color: .gray.opacity(0.20), radius: 25, x: 5, y: 10)
                        .scrollTransition(axis: .horizontal) { content, phase in
                            content
                                .scaleEffect(phase.isIdentity ? 0.95 : 0.50)
                        }
                        
                        Text(imageName)
                            .scrollTransition(axis: .horizontal) { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0.85)
                                    .offset(x: phase.value * 200)
                            }
                    }
                    
                }
            }
        }
        .contentMargins(36)
        .scrollTargetBehavior(.paging)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ContentView()
}
