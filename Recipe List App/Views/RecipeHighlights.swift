//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Vy Dang Phuong Nguyen on 10/27/22.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights:[String]) {
        for i in 0..<highlights.count {
            // If this is the last item, don't add a comma
            if i == highlights.count - 1 {
                allHighlights += highlights[i]
            }
            else {
                allHighlights += highlights[i] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHighlights)
            .font(Font.custom("Avenir", size: 16))
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["recipe 1", "recipe 2", "recipe 3"])
    }
}
