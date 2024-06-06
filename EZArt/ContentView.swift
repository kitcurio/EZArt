//
//  ContentView.swift
//  EZArt
//
//  Created by Kasia Rivers on 5/7/24.
//
import SwiftUI
import SwiftData

struct ContentView: View {
    
    
//    @Environment(\.modelContext) var modelContext
//    @State private var path = NavigationPath()
//    
//    @State private var sortOrder = [SortDescriptor(\TextEntry.name)]
//    @State private var searchText = ""
    @State private var promptManager = PromptManager()
    @State private var entries: [String] = []
    
    var body: some View {
//        TabView {
            Group {
                PromptView()
//                    .tabItem {
//                        Label("Home", systemImage: "house")
//                    }
                
                
                //                    .toolbarBackground(.visible, for: .tabBar)
                //                    .toolbarBackground(.indigo, for: .tabBar)
                //                    .toolbarColorScheme(.dark, for: .tabBar)

                //                NavigationStack(path: $path) {
                //                    TextSubmissionView(searchString: searchText, sortOrder: sortOrder)
                //                        .navigationTitle("Write")
                //                        .navigationDestination(for: TextEntry.self) { textentry in EditTextEntryView(navigationPath: $path, textentry: textentry)
                //                        }
                //                        .toolbar {
                //                            Menu("Sort", systemImage: "arrow.up.arrow.down") {
                //                                Picker("Sort", selection: $sortOrder) {
                //                                    Text("Name (A-Z)")
                //                                        .tag([SortDescriptor(\TextEntry.name)])
                //                                    Text("Name (Z-A)")
                //                                        .tag([SortDescriptor(\TextEntry.name, order: .reverse)])
                //                                }
                //                            }
                //                            Button("Add Text", systemImage: "plus", action: addTextEntry)
                //                        }
                //                        .searchable(text: $searchText)
                //
                //                }
                //                .tabItem{
                //                    Label("Gallery", systemImage: "photo.artframe")
                //                    Label("Write", systemImage: "pencil")
                //                }
                
        
                }
            }
        }
    



