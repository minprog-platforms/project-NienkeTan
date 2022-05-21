//  2. Recipe List


//  RecipesView.swift
//  Project
//
//  Created by Nienke Tan on 11/05/2022.
//

import SwiftUI

struct RecipesView: View {
    
    @State private var showingSheet = false
    @Binding var listofRecipes : [Recipe]
    
    var body: some View {
        ZStack{
            BackgroundMain()
            VStack{
                Text("Your Saved Recipes")
                    .foregroundColor(Color("textColorlight"))
                    .font(.system(size: 20, weight: .medium))
                    .frame(width: 350, height: 50)
                    .background(.white)
                    .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    .padding(.top, 15)
                
                List(listofRecipes) {item in
                    NavigationLink(destination: PageRecipeView(recipe: item)) {
                            RecipeCell(recipe: item)
                    }
                }
            }
        }.toolbar{
            Button {
                showingSheet.toggle()
            } label: {
                Image(systemName: "plus.square").foregroundColor(.white)
            }.sheet(isPresented: $showingSheet) {
                SheetAddRecipeView(listofRecipes: $listofRecipes)
            }
        }
    }
    
}

struct SheetAddRecipeView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var listofRecipes : [Recipe]
    @State var recipeName : String = ""
    @State var recipeIngredients : String = ""
    @State var recipeNote : String = ""
    @State var recipeImageName : String = ""
    
    var body: some View {
        Text("Add a new recipe")
            .foregroundColor(Color("textColorlight"))
            .font(.system(size: 20, weight: .medium))
            .frame(width: 350, height: 50)
            .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            .padding(.top, 15)
        Form {
            Text("Enter the recipe name:").foregroundColor(Color("backgroundColorblue"))
            TextField("Recipe Name", text: $recipeName)
            Text("Seperate the ingredients by a comma:").foregroundColor(Color("backgroundColorblue"))
            TextField("Ingredients", text: $recipeIngredients)
            Text("Write useful notes for your recipe:").foregroundColor(Color("backgroundColorblue"))
            TextField("Recipe Directions", text: $recipeNote)
            Text("Upload a photo of your recipe:").foregroundColor(Color("backgroundColorblue"))
            
            Button("Save") {
                listofRecipes.append(Recipe(name: recipeName, ingredients: recipeIngredients, imagename: recipeImageName, notes: recipeNote))
                dismiss()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.gray)
            .font(.system(size: 30, weight: .medium))
        }
        
        
    }
    
}


