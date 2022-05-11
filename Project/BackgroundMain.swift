//
//  BackgroundMain.swift
//  Project
//
//  Created by Nienke Tan on 07/05/2022.
//

import SwiftUI

struct BackgroundMain: View {
    var body: some View {
        VStack{
            Color("backgroundColorblue")
                .frame(width: 415, height: 195)
                .border(Color("textColorlight"), width: 0.5)
            
            Spacer()
            
        }.edgesIgnoringSafeArea(.all)
    }
}
