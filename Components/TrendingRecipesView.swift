import SwiftUI

struct TrendingRecipesView: View {
    let trendingRecipes: [Recipe]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Trending Recipes")
                    .font(.title)
                    .bold()
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    
                
                ForEach(trendingRecipes) { recipe in
                    RecipeCardView(recipe: recipe)
                        .padding(.horizontal)
                }
            }
        }
    }
}

struct TrendingRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingRecipesView(trendingRecipes: [
            Recipe(title: "Recipe 1", image: "recipe1"),
            Recipe(title: "Recipe 2", image: "recipe2"),
            Recipe(title: "Recipe 3", image: "recipe3")
        ])
    }
}
