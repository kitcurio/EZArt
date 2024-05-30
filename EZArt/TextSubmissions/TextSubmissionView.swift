//
//  TextSubmissionView.swift
//  EZArt
//
//  Created by Kasia Rivers on 5/29/24.
//

import Foundation
//
//  PeopleView.swift
//  FaceApp
//
//  Created by Lizmary Fernandez on 4/14/24.
//

import SwiftData
import SwiftUI

struct TextSubmissionView: View {
    @Environment(\.modelContext) var modelContext
    @Query var textsubmissions: [TextEntry]
    
    var body: some View {
        List {
            ForEach(textsubmissions) { textentry in
                NavigationLink(value: textentry) {
                    Text(textentry.name)
                }
            }
            .onDelete(perform: deleteText)
        }
    }
    
    init(searchString: String = "", sortOrder: [SortDescriptor<TextEntry>] = []){
        _textsubmissions = Query(filter: #Predicate { textentry in
            if searchString.isEmpty {
                true
            } else {
                textentry.name.localizedStandardContains(searchString)
                || textentry.details.localizedStandardContains(searchString)
            }
        }, sort: sortOrder)
    }
    
    func deleteText(at offsets: IndexSet) {
        for offset in offsets {
            let textentry = textsubmissions [offset]
            modelContext.delete(textentry)
        }
    }
}
    
        #Preview {
            TextSubmissionView()
        }
    

