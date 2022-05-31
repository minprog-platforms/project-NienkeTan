//
//  Cookbook.swift
//  Project
//
//  Created by Nienke Tan on 25/05/2022.
// https://www.hackingwithswift.com/books/ios-swiftui/saving-and-loading-data-with-userdefaults

import SwiftUI

class Cookbook: ObservableObject{
    @Published var items = [Recipe]()
    @Published var itemsperday: [String:[Recipe]] = Dictionary(uniqueKeysWithValues: zip(week, [[],[],[],[],[],[],[]]))
    @Published var currentday = "Monday"
    
    init(){
        load_items()
        load_itemsperday()
        load_currentday()
    }
    
    func load_items(){
        if let data1 = UserDefaults.standard.data(forKey: "SavedData1") {
            if let decoded1 = try? JSONDecoder().decode([Recipe].self, from: data1){
                items = decoded1
                return
            }
            items = [Recipe]()
        }
    }
    
    func load_itemsperday() {
        if let data2 = UserDefaults.standard.data(forKey: "SavedData2") {
            if let decoded2 = try? JSONDecoder().decode([String:[Recipe]].self, from: data2){
                itemsperday = decoded2
                return
            }
            itemsperday = Dictionary(uniqueKeysWithValues: zip(week, [[],[],[],[],[],[],[]]))
        }
    }
    
    func load_currentday() {
        if let data3 = UserDefaults.standard.data(forKey: "SavedData3") {
            if let decoded3 = try? JSONDecoder().decode([String:[Recipe]].self, from: data3){
                itemsperday = decoded3
                return
            }
            currentday = "Monday"
        }
    }
    
    func save() {
        if let encoded1 = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded1, forKey: "SavedData1")
        }
        
        if let encoded2 = try? JSONEncoder().encode(itemsperday) {
            UserDefaults.standard.set(encoded2, forKey: "SavedData2")
        }
        if let encoded3 = try? JSONEncoder().encode(itemsperday) {
            UserDefaults.standard.set(encoded3, forKey: "SavedData3")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        self.items.remove(atOffsets: offsets)
        
        for (day, _) in self.itemsperday {
            self.itemsperday[day]?.remove(atOffsets: offsets)
        }
        save()
    }
    
    func deleteSingleItem(at offsets: IndexSet) {
        self.itemsperday[self.currentday]?.remove(atOffsets: offsets)
        save()
    }
    
    func clearWeek() {
        for (day, _) in self.itemsperday {
            self.itemsperday[day] = []
        }
        save()
    }
    
    func saveRecipe(name: String, ingredients: String, image: UIImage, notes: String) {
        var ingredients = ingredients
        var image = image
        
        if ingredients != "" {
             ingredients = ingredients.replacingOccurrences(of: ", ", with: "\n").capitalized
        }
        
        if image == UIImage() {
            image = UIImage(named: "default_food")!
        }
        
        self.items.append(Recipe(name: name, ingredients: ingredients, image: image.jpegData(compressionQuality: 0.0)!, notes: notes))
        self.save()
    }
}
