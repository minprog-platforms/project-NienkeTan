//
//  SingleRecipe.swift
//  Project
//
//  Created by Nienke Tan on 11/05/2022.
//

import SwiftUI

struct SingleRecipe: View {
    var body: some View {

        ZStack{
            //background
            VStack{
                Text("Recipe Name")
                    .font(.system(size: 40, weight: .medium))
                    .frame(width: 350, height: 1)
                    .padding(.bottom)
                Image("food_lineart")
                    .resizable()
                    .frame(width: 350, height: 350)
                    .cornerRadius(10)
                
                Text("Ingredients: ")
                    .font(.system(size: 20))
                    .foregroundColor(Color("textColor"))
                    .frame(width: 350, height: 20, alignment: .leading)
                    .padding()
                
                Spacer()
                
                Text("Notes: ")
                    .font(.system(size: 20))
                    .foregroundColor(Color("textColor"))
                    .frame(width: 350, height: 20, alignment: .leading)
                    .padding()
                
                Spacer()
                
            }.padding(.vertical, 40)
        }
        .navigationBarTitle("")
    }
}

struct ContentView_Prev: PreviewProvider {
    static var previews: some View {
        SingleRecipe()
    }
}
