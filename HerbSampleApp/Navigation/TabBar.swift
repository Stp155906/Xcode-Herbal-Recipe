import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            
            TrendingRecipesView(trendingRecipes: [])
                .tabItem {
                    Image(systemName: "flame")
                    Text("Trending")
                }.padding(50)
            
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
            
            MessageView()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Messages")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
