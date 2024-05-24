//
//  ContentView.swift
//  EZArt
//
//  Created by Kasia Rivers on 5/7/24.
//
import SwiftUI

struct ContentView: View {
    
    //    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    
    //    @State var shouldShowOnboarding: Bool = true
    //        VStack {
    //            Image(.palette)
    //                .scaledToFit()
    //                .imageScale(.large)
    //            Text("EZArt")
    //                .font(.system(.title, design: .monospaced))
    //                .fontWeight(.medium)
    //                .frame(minHeight: 75)
    //        }
    
    @State private var promptManager = PromptManager()
    
    var body: some View {
        
        TabView {
            VStack {
                if let currentPrompt = promptManager.currentPrompt {
                    Text(currentPrompt.text)
                        .font(.largeTitle)
                        .padding()
                } else {
                    Text("Loading...")
                        .font(.largeTitle)
                        .padding()
                }
            }
            
            .padding()
            .tabItem { Label("Home", systemImage: "house") }
        }
        
        //            .fullScreenCover(isPresented: $shouldShowOnboarding, content: {
        //                OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)
        //            })
    }
}

#Preview {
    ContentView()
}
