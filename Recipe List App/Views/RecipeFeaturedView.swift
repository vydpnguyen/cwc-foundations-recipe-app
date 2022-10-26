//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Vy Dang Phuong Nguyen on 10/25/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Text("Featured")
                .fontWeight(.bold)
                .padding(.leading)
                .padding(.top, 20)
                .font(.largeTitle)
                
            GeometryReader { geo in
                
                TabView {
                    // Only show recipes that should be featured
                    ForEach(0..<model.recipes.count) { i in
                        
                        if model.recipes[i].featured {
                            // Recipe card
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
        
                                VStack(spacing: 0) {
                                    Image(model.recipes[i].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    
                                    Text(model.recipes[i].name)
                                        .fontWeight(.bold)
                                        .padding(5)
                                }
                                
                            }
                            .frame(width: geo.size.width-40, height: geo.size.height-100, alignment: .center)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                        }
                        
                    }
                }
                // Dots when swiping
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                // Make dots visible
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time")
                    .font(.headline)
                Text("1 hour")
                Text("Highlights")
                    .font(.headline)
                Text("Vegan")
            }
            .padding([.leading, .bottom], 10)
        }
        
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
