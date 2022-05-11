//
//  RecipePerDay.swift
//  Project
//
//  Created by Nienke Tan on 11/05/2022.
//

import SwiftUI

struct RecipePerDay: View {
    var body: some View {
        List(0..<3) { item in
            VStack(alignment: .leading){
                Text("Some Recipe")
                Image(systemName: "photo")
            }
        }
    }
}
