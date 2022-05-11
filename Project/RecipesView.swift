//
//  RecipesView.swift
//  Project
//
//  Created by Nienke Tan on 11/05/2022.
//

import SwiftUI

struct RecipesView: View {
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
                
                List(0..<3) { item in
                    NavigationLink(destination: SingleRecipe()) {
                        VStack(alignment: .leading){
                            Text("Some Recipe")
                            Image(systemName: "photo")
                        }
                    }
                }
            }
        }
    }
}
