import SwiftUI

struct HomeView: View {
    @State private var showTabBar = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image("figmaMain")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                    
                    Divider()
                        .padding(.vertical, 16)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(1...6, id: \.self) { index in
                            CardView(imageName: "card\(index)", title: "Card \(index)", description: "This is card \(index)")
                                .frame(width: (UIScreen.main.bounds.width - 48) / 2, height: 225)
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    Button(action: {
                        showTabBar = true
                    }) {
                        Text("Show TabBar View")
                            .foregroundColor(.black)
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.figmaLinearGradient)
                            .cornerRadius(8)
                            .padding(.horizontal, 21)
                    }
                    .padding(.vertical, 16)
                    
                    if showTabBar {
                        TabBar()
                            .transition(.move(edge: .bottom))
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}



struct CardView: View {
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: 120)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.14), radius: 4, x: 0, y: 2)
    }
       
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension Color {
    static let figmaLinearGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 0.53, green: 0.89, blue: 0.81),
            Color(red: 0.82, green: 0.9, blue: 0.65)
        ]),
        startPoint: .leading,
        endPoint: .trailing
    )
}
