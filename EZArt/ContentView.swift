//
//  ContentView.swift
//  EZArt
//
//  Created by Kasia Rivers on 5/7/24.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(.palette)
                .scaledToFit()
                .imageScale(.large)
            Text("EZArt")
                .font(.system(.title, design: .monospaced))
                .fontWeight(.medium)
                .frame(minHeight: 75)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
