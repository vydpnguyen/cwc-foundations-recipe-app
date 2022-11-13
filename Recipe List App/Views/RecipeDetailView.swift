//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-01-14.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    //@EnvironmentObject var model:RecipeModel
    @State var selectedServingSize = 2
    @State var isDetailViewShowing = false
    
    var body: some View {
        
        ScrollView {
            
            VStack (alignment: .leading) {
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe Title
                Text(recipe.name)
                    .fontWeight(.bold)
                    .padding([.top,.bottom], 10)
                    .padding(.leading)
                    .font(Font.custom("Avenir Heavy", size: 25))
                
                // MARK: Serving Size Picker
                VStack(alignment: .leading) {
                    Text("Select your serving size")
                        .font(Font.custom("Avenir", size: 16))
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 180)
                    .font(Font.custom("Avenir", size: 16))
                }
                .padding()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                        .font(Font.custom("Avenir Heavy", size: 20))
                    
                    ForEach (recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                            .font(Font.custom("Avenir", size: 16))
                    }
                }
                .padding(.horizontal)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                        .font(Font.custom("Avenir Heavy", size: 20))
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                            .font(Font.custom("Avenir", size: 16))
                    }
                }
                .padding(.horizontal)
            }
            
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it into the detail view so that we can see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
