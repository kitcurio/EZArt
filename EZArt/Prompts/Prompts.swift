//
//  Prompts.swift
//  EZArt
//
//  Created by Kasia Rivers on 5/23/24.
//

import Foundation
import SwiftUI

struct Prompt: Identifiable {
    let id = UUID()
    let text: String
}


func loadPrompts() -> [Prompt] {
    guard let url = Bundle.main.url(forResource: "prompts", withExtension: "json") else {
        print("Failed to find prompts.json in the bundle.")
        return []
    }

    do {
        let data = try Data(contentsOf: url)
        let array = try JSONDecoder().decode([String].self, from: data)
        print("Successfully loaded prompts: \(array)")
        return array.map { Prompt(text: $0) }
    } catch {
        print("Failed to load or decode prompts.json: \(error)")
        return []
    }
}




