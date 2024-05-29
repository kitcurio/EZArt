//
//  EditText.swift
//  EZArt
//
//  Created by Kasia Rivers on 5/28/24.
//

import Foundation
import SwiftData
import SwiftUI

struct EditTextEntryView: View {
    @Bindable var textentry: TextEntry
    
    var body: some View {
        Form {
            Section {
                TextField("Type", text: $textentry.name)
                    .textContentType(.name)
            }
        }
        .navigationTitle("Edit Text")
        .navigationBarTitleDisplayMode(.inline)
    }
}
