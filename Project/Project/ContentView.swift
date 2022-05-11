//
//  ContentView.swift
//  Project
//
//  Created by Nienke Tan on 29/04/2022.
//

import SwiftUI

struct ContentView: View {

    let weekdays : [String] = ["M","T", "W", "T", "F", "S", "S"]
    init(){
        UINavigationBar.appearance()
            .largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }

    var body: some View {
        TabView {
            NavigationView {
                ZStack{

                    BackgroundMain()

                    VStack{
                        
                        HStack(){
                            ForEach(weekdays, id: \.self) {
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
                        }.padding(.vertical, 15)
                        
                        List(0..<3) { item in
                            HStack{
                                Image(systemName: "photo")
                                VStack(alignment: .leading){
                                    Text("Some Recipe")
                                    Text("Number ingredients")
                                }
                            }
                        }
                        
                        Spacer()
                        
                    }
                    
                }.navigationTitle("Dinner Planner")
                
            }.tabItem {
                Image(systemName: "calendar").foregroundColor(.black)
                    .font(.system(size: CGFloat(40)))
                    .frame(width: 120, height: 40.0)
                
                
                Text("Calendar").foregroundColor(.black)
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


