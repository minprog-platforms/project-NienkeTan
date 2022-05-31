//
//  SingleRecipe.swift
//  Project
//
//  Created by Nienke Tan on 11/05/2022.
//

import SwiftUI

struct PageRecipeView: View {
    let recipe: Recipe
    
    var body: some View {
        ZStack{
            BackgroundMain()
            VStack{
                Text(recipe.name)
                    .font(.system(size: 40, weight: .medium))
                    .frame(width: 350, height: 1, alignment: .leading)
                    .padding(.bottom)
                    .foregroundColor(.white)
                
                ScrollView{
                    Image(uiImage: UIImage(data: recipe.image)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 350, height: 350)
                        .cornerRadius(10)
                    
                    Text("Ingredients")
                        .font(.system(size: 30, weight: .medium))
                        .foregroundColor(Color("textColor"))
                        .frame(width: 350, height: 30, alignment: .leading)
                        .padding()
                    
                    Text(recipe.ingredients)
                        .font(.system(size: 20, weight: .light))
                        .frame(width: 350, height: 150, alignment: .topLeading)
                    
                    Text("Notes")
                        .font(.system(size: 30, weight: .medium))
                        .foregroundColor(Color("textColor"))
                        .frame(width: 350, height: 30, alignment: .leading)
                        .padding()
                    
                    Text(recipe.notes)
                        .font(.system(size: 20, weight: .light))
                        .frame(width: 350, height: 60, alignment: .topLeading)
                    
                    Spacer()
                }
            }.padding(.bottom, 40)
        }
        .navigationBarTitle("")
    }
}

