//
//  Recipe.swift
//  Project
//
//  Created by Nienke Tan on 18/05/2022.
//

import SwiftUI

struct Recipe: Identifiable {
    let id = UUID()
    let name : String
    let ingredients: String
    let imagename: String
    let notes: String
}

