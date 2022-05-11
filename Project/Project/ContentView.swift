//
//  ContentView.swift
//  Project
//
//  Created by Nienke Tan on 29/04/2022.
//

import SwiftUI

struct ContentView: View {

    init(){
        UINavigationBar.appearance()
            .largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }

    var body: some View {
        TabView {
            NavigationView {
                PlannerView().navigationTitle("Dinner Planner")
            }.tabItem {
                Image(systemName: "calendar").foregroundColor(.black)
                    .frame(width: 120, height: 40.0)
                
                Text("Calendar").foregroundColor(.black)
                    .font(.system(size: 20, weight: .light))
            }
            NavigationView{
                RecipesView().navigationTitle("Recipes")
            }.tabItem {
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
    }
}


