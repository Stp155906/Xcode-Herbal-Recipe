import SwiftUI

struct RecipeCardView: View {
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

struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(recipe: Recipe(title: "Delicious Recipe", image: "recipe_image"))
    }
}
