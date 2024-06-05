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
    @State private var textSheet: Bool = false 
    @State private var entries: [String] = []
    
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

                HStack {
                    Button(action: {
                        textSheet.toggle()
                    }, label: {
                        ZStack {
                            Image("splatBlue")
                            Image("pencil")
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(maxWidth: 150, maxHeight: 150)
                    })
                    .padding(.trailing)
                    .sheet(isPresented: $textSheet) {
                        TextListView(entries: $entries)
                    }
                    
                    Button(action: {
                        
                    }, label: {
                        ZStack {
                            Image("splatYellow")
                            Image("film")
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(maxWidth: 150, maxHeight: 150)
                    })
                    .padding(.leading)
                }
            }
        }
    }
    

}
#Preview {
    PromptView()
}
