//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Vy Dang Phuong Nguyen on 10/25/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        let featuredRecipes = model.recipes.filter({ $0.featured })
        /*
         let featuredRecipe = model.recipes.filter { r in
         if r.featured == true {
         return
         }
         }
         */
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes")
                .fontWeight(.bold)
                .padding(.leading)
                .padding(.top, 20)
                .font(Font.custom("Avenir Heavy", size: 30))
            
            GeometryReader { geo in
                
                TabView(selection: $tabSelectionIndex) {
                    
                    ForEach(0..<featuredRecipes.count) { i in
                        
                        Button (action: {
                            // When the button is tap, this will become true
                            self.isDetailViewShowing = true
                        },
                                label: {
                            // Recipe card
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                
                                VStack(spacing: 0) {
                                    Image(featuredRecipes[i].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    
                                    Text(featuredRecipes[i].name)
                                        .fontWeight(.bold)
                                        .padding(5)
                                        .font(Font.custom("Avenir", size: 20))
                                }
                                
                            }
                        })
                        .tag(i)
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geo.size.width-40, height: geo.size.height-100, alignment: .center)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        
                        
                    }
                }
                // Dots when swiping
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                // Make dots visible
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time")
                    .font(Font.custom("Avenir Heavy", size: 20))
                Text(featuredRecipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir", size: 16))
                Text("Highlights")
                    .font(Font.custom("Avenir Heavy", size: 20))
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
                    .font(Font.custom("Avenir", size: 16))
            }
            .padding([.leading, .bottom], 10)
        }
        .sheet(isPresented: $isDetailViewShowing) {
            // Show the RecipeDetailView
            RecipeDetailView(recipe: featuredRecipes[tabSelectionIndex])
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
