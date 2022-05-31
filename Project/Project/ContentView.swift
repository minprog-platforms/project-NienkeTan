//
//  ContentView.swift
//  Project
//
//  Created by Nienke Tan on 29/04/2022.
//

import SwiftUI

let week = ["Monday","Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
let defaultColors = Dictionary(uniqueKeysWithValues: zip(week, [Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white]))

struct ContentView: View {
    @StateObject var cookbook = Cookbook()
    
    init(){
        UINavigationBar.appearance()
            .largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        TabView {
            NavigationView {
                PlannerView().environmentObject(cookbook).navigationTitle("Dinner Planner")
            }.accentColor(.white).tabItem {
                Image(systemName: "calendar").foregroundColor(.black)
                    .frame(width: 120, height: 40.0)
                
                Text("Calendar").foregroundColor(.black)
                    .font(.system(size: 20, weight: .light))
            }
            NavigationView{
                RecipesView().environmentObject(cookbook).navigationTitle("Recipes")
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
            .environmentObject(Cookbook())
    }
}


