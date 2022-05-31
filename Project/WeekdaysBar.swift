//
//  WeekdaysBar.swift
//  Project
//
//  Created by Nienke Tan on 11/05/2022.
//

import SwiftUI

struct WeekdaysBar: View {
    @EnvironmentObject var cookbook: Cookbook
    @State private var barColors: [String:Color] = defaultColors
    
    
    var body: some View {
        HStack(){
            ForEach(week, id: \.self) {
                day in
                VStack{
                    Button{
                        cookbook.currentday = day
                        barColors = defaultColors
                        barColors[day] = Color("textColor")
                    }label: {Text(day.prefix(1))
                            .foregroundColor(Color("textColorlight"))
                            .font(.system(size: 20, weight: .medium))
                            .frame(width: 50, height: 50)
                            .background(barColors[day])
                        
                    }
                    .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    
                    if cookbook.itemsperday[day]!.count != 0 {
                        Circle()
                            .frame(width: 15, height: 15)
                            .foregroundColor(Color("backgroundColorblue"))
                    } else {
                        Circle()
                            .stroke(Color("backgroundColorblue"), lineWidth:  1.5)
                            .frame(width: 15, height: 15)
                            .foregroundColor(Color("textColorlight"))
                    }
                }
            }
        }.padding(.top, 15).onAppear {
            barColors[cookbook.currentday] = Color("textColor")
        }
        
        Text(cookbook.currentday)
                .font(.system(size: 20))
                .frame(width: 350, height: 30)
                .foregroundColor(Color("textColorlight"))
            
    }
    
}

