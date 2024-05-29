//
//  TextEntry.swift
//  EZArt
//
//  Created by Kasia Rivers on 5/28/24.
//

import Foundation
import SwiftData

//this is a macro it rewrites our code and adds functionality
@Model
class TextEntry {
    //structs have transferrable data unlike structs
    //classes over structs
    var name: String
    var emailAddress: String
    var details: String
    //OPTIONAL BECAUSE IT DOESN'T HAVE A VALUE INITIALLY
    
    init(name: String, emailAddress: String, details: String) {
        self.name = name
        self.emailAddress = emailAddress
        self.details = details
    }
       
    }
