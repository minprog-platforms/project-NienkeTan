//
//  Recipe.swift
//  Project
//
//  Created by Nienke Tan on 18/05/2022.
//

import SwiftUI

struct Recipe: Identifiable, Codable {
    var id = UUID()
    let name : String
    let ingredients: String
    let image: Data
    let notes: String  
}
