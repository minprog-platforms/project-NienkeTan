//  1. Planner


//  PlannerView.swift
//  Project
//
//  Created by Nienke Tan on 11/05/2022.
//

import SwiftUI

struct PlannerView: View {
    @State private var showingSheet = false
    @State private var showingAlert = false
    @EnvironmentObject var cookbook: Cookbook
    
    var body: some View {
        ZStack{
            BackgroundMain()
            VStack{
                WeekdaysBar()
                
                List{
                    Section{
                        ForEach(cookbook.itemsperday[cookbook.currentday]!)
                        { item in NavigationLink(destination: PageRecipeView(recipe: item)) {
                            RecipeCell(recipe: item)
                        }
                        }.onDelete(perform: cookbook.deleteSingleItem)
                    }
                }

                Button("Clear Week") {
                    showingAlert = true
                }.foregroundColor(Color.blue).frame(width: 200, height: 40, alignment: .center)
                    .padding(.vertical)
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Are you sure you want to clear this week?"),
                            primaryButton: .destructive(Text("Clear")) {
                                cookbook.clearWeek()
                            },
                            secondaryButton: .cancel()
                        )
                    }
            }
        }.toolbar{
            HStack{
                EditButton()
                Button {
                    if cookbook.items.count != 0{
                        showingSheet.toggle()
                    }
                } label: {
                    Image(systemName: "plus.square")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(.white)
                        .frame(width: 30.0, height: 30.0)
                }.sheet(isPresented: $showingSheet) {
                    SheetAddRecipeto_View(cookbook: cookbook)
                }
            }
        }
    }
}

struct SheetAddRecipeto_View: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var cookbook: Cookbook
    
    var body: some View {
        
        List(cookbook.items) {item in
            Button{
                cookbook.itemsperday[cookbook.currentday]!.append(item)
                cookbook.save()
                dismiss()
            } label: {
                RecipeCell(recipe: item)
            }
        }
    }
}

