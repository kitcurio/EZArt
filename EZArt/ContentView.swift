//
//  ContentView.swift
//  EZArt
//
//  Created by Kasia Rivers on 5/7/24.
//
import SwiftUI
import SwiftData

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
    
    @Environment(\.modelContext) var modelContext
    @State private var path = [TextEntry]()
    @Query var textSubmissions: [TextEntry]
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(textSubmissions) { textentry in
                    NavigationLink(value: textentry) {
                        Text(textentry.name)
                    }
                }
            }
            .navigationTitle("Daily")
            .navigationDestination(for:
                                    TextEntry.self) { textentry in EditTextEntryView(textentry: textentry)
            }
                                    .toolbar {
                                        Button("Add text", systemImage: "plus", action: addTextEntry)
                                    }
        }
        
        //            .fullScreenCover(isPresented: $shouldShowOnboarding, content: {
        //                OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)
        //            })
    }
    func addTextEntry() {
        let textentry = TextEntry(name: "", emailAddress: "", details: "")
        modelContext.insert(textentry)
        path.append(textentry)
    }
}

#Preview {
    ContentView()
}
