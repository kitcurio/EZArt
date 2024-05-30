//
//  EditPersonView.swift
//  FaceApp
//
//  Created by Lizmary Fernandez on 4/14/24.
//

import SwiftData
import SwiftUI

struct EditTextEntryView: View {
    @Environment (\.modelContext) var modelContext
    @Binding var navigationPath: NavigationPath
    @Bindable var textentry: TextEntry
    
//    @Query(sort: [
//        SortDescriptor(\Event.name),
//        SortDescriptor(\Event.location)
//    ]) var events: [Event]
    
    var body: some View {
        Form {
            Section {
                //                //
                TextField("Name", text: $textentry.name)
                    .textContentType(.name)
                //tells ios to use auto-completion when typing a name
            
       
            }
        }
    }
}


