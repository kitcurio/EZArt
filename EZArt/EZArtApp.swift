//
//  EZArtApp.swift
//  EZArt
//
//  Created by Kasia Rivers on 5/7/24.
//

import SwiftUI
import SwiftData

@main
struct EZArtApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: TextEntry.self)
    }
}
