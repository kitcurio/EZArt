//
//  PromptView.swift
//  EZArt
//
//  Created by Kasia Rivers on 5/28/24.
//

import Foundation
import SwiftUI

struct PromptView: View {
    @State private var promptManager = PromptManager()
    @State private var isPresented: Bool = false
    
    var body: some View {
        ZStack {
            Image("paperBG")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                if let currentPrompt = promptManager.currentPrompt {
                    Text(currentPrompt.text)
                        .font(.custom("Chalkboard-Regular", size: 50))
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    Text("Loading...")
                        .font(.largeTitle)
                        .padding()
                }
                
//                Button("Press me"){
//                    isPresented.toggle()
//                }
//                    .fullScreenCover(isPresented: $isPresented, content:
//                                        AddPhotoView.init)
            }
        }
    }
    
}
#Preview {
    PromptView()
}
