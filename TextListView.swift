//
//  TextListView.swift
//  EZArt
//
//  Created by Kasia Rivers on 6/4/24.
//

import SwiftUI

struct TextListView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State private var path = NavigationPath()
    
    @State private var sortOrder = [SortDescriptor(\TextEntry.name)]
    @State private var searchText = ""
    @State private var newEntry = ""
    
    @Binding var entries: [String]
    
    var body: some View {
    
//        NavigationStack(path: $path) {
//            TextSubmissionView(searchString: searchText, sortOrder: sortOrder)
//                .navigationTitle("Write")
//                .navigationDestination(for: TextEntry.self) { textentry in EditTextEntryView(navigationPath: $path, textentry: textentry)
//                }
//                .toolbar {
//                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
//                        Picker("Sort", selection: $sortOrder) {
//                            Text("Name (A-Z)")
//                                .tag([SortDescriptor(\TextEntry.name)])
//                            Text("Name (Z-A)")
//                                .tag([SortDescriptor(\TextEntry.name, order: .reverse)])
//                        }
//                    }
//                    Button("Add Text", systemImage: "plus", action: addTextEntry)
//                }
//                .searchable(text: $searchText)
//            
//        }
        
        NavigationView {
            VStack {
                TextField("Enter your text here", text: $newEntry)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 400)
                
                Button(action: {
                    if !newEntry.isEmpty {
                        entries.append(newEntry)
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Save Entry")
                        .font(.title)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 5)
                
                Spacer()
            }
            .padding()
            .navigationTitle("New Entry")
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }

    }
    
    func addTextEntry() {
        let textentry = TextEntry(name: "", details: "")
        modelContext.insert(textentry)
        path.append(textentry)
    }
}



//#Preview {
//    TextListView(entries: )
//}
