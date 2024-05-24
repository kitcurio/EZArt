//
//  LoadScreen.swift
//  EZArt
//
//  Created by Kasia Rivers on 5/19/24.
//

import Foundation
import SwiftUI

struct LoadScreen: View {
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
    LoadScreen()
}

