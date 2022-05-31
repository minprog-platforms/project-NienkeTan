//
//  RecipeCell.swift
//  Project
//
//  Created by Nienke Tan on 21/05/2022.
//

import SwiftUI

struct RecipeCell: View {
    
    let recipe : Recipe
    
    var body: some View {
        HStack{
            Image(uiImage: UIImage(data: recipe.image)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50, alignment: .leading)
                .cornerRadius(25)
            Text(recipe.name)
                .font(.system(size: 20, weight: .light))
                .foregroundColor(.black)
        }
    }
}
