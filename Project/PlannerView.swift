//  1. Planner


//  PlannerView.swift
//  Project
//
//  Created by Nienke Tan on 11/05/2022.
//

import SwiftUI

struct PlannerView: View {
    
    @State private var showingSheet = false
    @Binding var listofRecipes: [Recipe]
    @Binding var weekdayRecipes: [String:[Recipe]]
    @Binding var isweekday: String
    
    var body: some View {
        ZStack{
            BackgroundMain()
            VStack{
                // Bar of weekdays and checkmarks
                WeekdaysBar(weekdayRecipes: $weekdayRecipes, isweekday: $isweekday)
                
                 //List all recipes on day pressed
                List(weekdayRecipes[isweekday] ??
                     [Recipe(name: "Add a recipe", ingredients: "", imagename: "default_food", notes: "")])
                { item in NavigationLink(destination: PageRecipeView(recipe: item)) {
                    RecipeCell(recipe: item)
            }
                }
                Spacer()
            }
        }.toolbar{
            Button {
                showingSheet.toggle()
                 } label: {
                     Image(systemName: "plus.square").foregroundColor(.white)
            }.sheet(isPresented: $showingSheet) {
                SheetAddRecipeto_View(listofRecipes: $listofRecipes, weekdayRecipes: $weekdayRecipes, isweekday: $isweekday)
            }
        }
    }
}

struct SheetAddRecipeto_View: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var listofRecipes: [Recipe]
    @Binding var weekdayRecipes: [String:[Recipe]]
    @Binding var isweekday: String
    
    var body: some View {
        List(listofRecipes) { item in
            Button{
                weekdayRecipes[isweekday]?.append(item)
                    dismiss()
            } label: {
                RecipeCell(recipe: item)
            }
        }
    }
}

