//
//  WeekdaysBar.swift
//  Project
//
//  Created by Nienke Tan on 11/05/2022.
//

import SwiftUI

struct WeekdaysBar: View {
    var body: some View {
        HStack(){
            ForEach(["M","T", "W", "T", "F", "S", "S"], id: \.self) {
                weekDay in
                VStack{
                    Button{
                        
                    }label: {Text(weekDay)
                            .foregroundColor(Color("textColorlight"))
                            .font(.system(size: 20, weight: .medium))
                            .frame(width: 50, height: 50)
                            .background(.white)
                        
                    }
                    .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    
                    Circle()
                        .stroke(Color("backgroundColorblue"), lineWidth:  1.5)
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color("textColorlight"))
                    
                }
            }
        }.padding(.top, 15)
    }
}
