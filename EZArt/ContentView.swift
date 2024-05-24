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
    @State var promptManager: PromptManager
    
    init(prompts: [Prompt]) {
        promptManager = PromptManager(prompts: prompts)
    }
    
    var body: some View {
        
        TabView {
            VStack {
                if let prompt = promptManager.currentPrompt {
                    Text(prompt.text)
                        .font(.largeTitle)
                        .padding()
                } else {
                    Text("No more prompts available.")
                        .font(.largeTitle)
                        .padding()
                }
                
                //                Button(action: {
                //                    promptManager.displayNextPrompt()
                //                }) {
                //                    Text("Next Prompt")
                //                        .font(.title)
                //                        .padding()
                //                        .background(Color.blue)
                //                        .foregroundColor(.white)
                //                        .cornerRadius(10)
                //                }
                
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
    ContentView(
        prompts: [
            Prompt(text: "personify the sun"),
            Prompt(text: "i hate this shit"),
            Prompt(text: "kill me right fucking now")
        ]
    )
}
