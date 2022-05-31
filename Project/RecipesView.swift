//  2. Recipe List


//  RecipesView.swift
//  Project
//
//  Created by Nienke Tan on 11/05/2022.
//

import SwiftUI

struct RecipesView: View {
    @State private var showingSheet = false
    @EnvironmentObject var cookbook: Cookbook
    
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
                
                List{
                    Section{
                        ForEach(cookbook.items) {item in
                            NavigationLink(destination: PageRecipeView(recipe: item)) {
                                RecipeCell(recipe: item)
                            }
                        }.onDelete(perform: cookbook.deleteItems)
                    }
                }
                Spacer()
            }
        }.toolbar{
            HStack{
                EditButton()
                
                Button {
                    showingSheet.toggle()
                } label: {
                    Image(systemName: "plus.square")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(.white)
                        .frame(width: 30.0, height: 30.0)
                }.sheet(isPresented: $showingSheet) {
                    SheetAddRecipeView(cookbook: cookbook)
                }
            }
        }
    }
    
}

struct SheetAddRecipeView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var cookbook: Cookbook
    @State private var showImagePicker = false
    
    @State var recipeName : String = ""
    @State var recipeIngredients : String = ""
    @State var recipeNote : String = ""
    @State private var recipeImage = UIImage()
    
    var body: some View {
        VStack{
            Text("Add a new recipe")
                .foregroundColor(Color("textColorlight"))
                .font(.system(size: 20, weight: .medium))
                .frame(width: 350, height: 50, alignment: .leading)
                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                .padding(.top, 15)
            
            Form {
                Section{
                    TextField("Recipe Name", text: $recipeName)
                }
                Section(header: Text("Ingredients")){
                    TextEditor(text: $recipeIngredients).frame(width: 350, height: 200)
                }
                Section(header: Text("Directions")){
                    TextEditor(text: $recipeNote).frame(width: 350, height: 200)
                }
                Section{
                    HStack{
                        Image(uiImage: self.recipeImage)
                            .resizable()
                            .cornerRadius(50)
                            .padding(.all, 4)
                            .frame(width: 100, height: 100)
                            .background(Color.black.opacity(0.2))
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .padding(8)
                        Spacer()
                        Button{
                            showImagePicker = true
                        } label: {
                            Text("Select photo")
                                .padding()
                                .foregroundColor(.white)
                                .frame(width: 150, height: 50,alignment: .center)
                                .background(Color("backgroundColorblue"))
                                .font(.system(size: 20, weight: .medium))
                                .cornerRadius(5)
                            
                        }.padding(10).buttonStyle(BorderlessButtonStyle()).sheet(isPresented: $showImagePicker) {
                            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$recipeImage)
                        }
                    }
                }
                
                
                Section{
                    HStack{
                        Button{
                            dismiss()
                        }label: {Text("Back")
                                .padding()
                                .foregroundColor(Color("backgroundColorblue"))
                                .frame(width: 100, height: 50,alignment: .center)
                                .font(.system(size: 20, weight: .medium))
                                .cornerRadius(5)
                        }.padding(10).buttonStyle(BorderlessButtonStyle())
                        
                        Spacer()
                        
                        Button{
                            cookbook.saveRecipe(name: recipeName, ingredients: recipeIngredients, image: recipeImage, notes: recipeNote)
                            dismiss()
                        } label:{ Text("Save")
                                .padding()
                                .foregroundColor(.white)
                                .frame(width: 120, height: 50, alignment: .center)
                                .background(Color("backgroundColorblue"))
                                .font(.system(size: 20, weight: .medium))
                                .cornerRadius(5)
                        }.padding(10).buttonStyle(BorderlessButtonStyle())
                        
                    }
                }
            }
        }
        
    }
    
}

