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
                ZStack{
                    BackgroundMain()
                    VStack{
                        WeekdaysBar()
                        
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


