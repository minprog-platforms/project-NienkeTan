//
//  PlannerView.swift
//  Project
//
//  Created by Nienke Tan on 11/05/2022.
//

import SwiftUI

struct PlannerView: View {
    var body: some View {
        ZStack{
            BackgroundMain()
            VStack{
                WeekdaysBar()
                
                Text("Monday")
                    .font(.system(size: 20))
                    .frame(width: 350, height: 30)
                    .foregroundColor(Color("textColorlight"))
                
                RecipePerDay()
                
                Spacer()
            }
        }
    }
}

