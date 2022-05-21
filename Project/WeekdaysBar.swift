//
//  WeekdaysBar.swift
//  Project
//
//  Created by Nienke Tan on 11/05/2022.
//

import SwiftUI

struct WeekdaysBar: View {
    
    @Binding var weekdayRecipes: [String:[Recipe]]
    @Binding var isweekday: String
    
    var body: some View {
        HStack(){
            ForEach(week, id: \.self) {
                weekday in
                VStack{
                    Button{
                        isweekday = weekday
                        print(isweekday)
                        print(weekdayRecipes)
                        print(weekday)
                    }label: {Text(weekday.prefix(1))
                            .foregroundColor(Color("textColorlight"))
                            .font(.system(size: 20, weight: .medium))
                            .frame(width: 50, height: 50)
                            .background(.white)
                        
                    }
                    .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    
                    if weekdayRecipes[weekday]!.count != 0 {
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
        }.padding(.top, 15)
            Text(isweekday)
                .font(.system(size: 20))
                .frame(width: 350, height: 30)
                .foregroundColor(Color("textColorlight"))
            
        }
    
}

