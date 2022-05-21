//
//  ContentView.swift
//  Project
//
//  Created by Nienke Tan on 29/04/2022.
//

import SwiftUI

var week : [String] = ["Monday","Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
var empty: [[Recipe]] = [[],[],[],[],[],[],[]]
var testdata: [Recipe] =
[Recipe(name: "Noodles", ingredients: "Noodle \n1 Pepper \n1 Onion \n1 Garlic", imagename: "default_food", notes: "No directions"),
Recipe(name: "Rice", ingredients: "Rice \n1 Salt", imagename: "default_food", notes: "No directions"),
Recipe(name: "Steak", ingredients: "Steak \n1 Butter", imagename: "default_food", notes: "No directions")]

struct ContentView: View {
    
    @State var listofRecipes: [Recipe] = testdata
    @State var weekdayRecipes: [String:[Recipe]] = Dictionary(uniqueKeysWithValues: zip(week, empty))
    @State var isweekday: String = "Monday"
    
    init(){
        UINavigationBar.appearance()
            .largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        TabView {
            NavigationView {
                PlannerView(listofRecipes: $listofRecipes, weekdayRecipes: $weekdayRecipes, isweekday: $isweekday).navigationTitle("Dinner Planner")
            }.accentColor(.white).tabItem {
                Image(systemName: "calendar").foregroundColor(.black)
                    .frame(width: 120, height: 40.0)
                
                Text("Calendar").foregroundColor(.black)
                    .font(.system(size: 20, weight: .light))
            }
            NavigationView{
                RecipesView(listofRecipes: $listofRecipes).navigationTitle("Recipes")
            }.accentColor(.white).tabItem {
                Image(systemName: "fork.knife").foregroundColor(.black)
                    .frame(width: 120, height: 40.0)
                
                Text("Recipes").foregroundColor(.black)
                    .font(.system(size: 20, weight: .light))
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}


