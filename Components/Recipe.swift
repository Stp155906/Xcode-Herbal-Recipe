//
//  Recipe.swift
//  HerbSampleApp
//
//  Created by Shantalia Z on 5/22/23.

import SwiftUI

struct Recipe: Identifiable {
    let id = UUID()
    let title: String
    let image: String
}

struct RecipeView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack {
            Image(recipe.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            
            Text(recipe.title)
                .font(.headline)
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: Recipe(title: "Sample Recipe", image: "sampleImage"))
    }
}

