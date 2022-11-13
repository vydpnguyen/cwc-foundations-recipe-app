//
//  ContentView.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-01-14.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .font(Font.custom("Avenir Heavy", size: 30))
                
                
                ScrollView {
                    // Only render objects as needed
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) { r in
                            NavigationLink(
                                destination: RecipeDetailView(recipe:r),
                                label: {
                                    
                                    // MARK: Row item
                                    HStack(spacing: 20.0) {
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .clipped()
                                            .cornerRadius(5)
                                        
                                        VStack(alignment: .leading) {
                                            Text(r.name)
                                                .foregroundColor(.black)
                                                .fontWeight(.bold)
                                                .font(Font.custom("Avenir Heavy", size: 20))
                                            RecipeHighlights(highlights: r.highlights)
                                                .foregroundColor(.black)
                                                .font(Font.custom("Avenir", size: 16))
                                        }
                                    }
                                })
                        }
                    }
                }
            }
            // Hide the title
            .navigationBarHidden(true)
            .padding()
    
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
