import SwiftUI

struct MessageView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(spacing: 16) {
                        MessageBubble(content: "Hey, how are you?", alignment: .leading, backgroundColor: Color(red: 0.9, green: 0.9, blue: 0.9))
                        
                        MessageBubble(content: "I'm good, thanks! How about you?", alignment: .trailing, backgroundColor: Color(red: 0.2, green: 0.6, blue: 0.8))
                        
                        MessageBubble(content: "I'm doing great too. Just enjoying the day.", alignment: .leading, backgroundColor: Color(red: 0.9, green: 0.9, blue: 0.9))
                        
                        MessageBubble(content: "That's awesome! It's such a beautiful day outside.", alignment: .trailing, backgroundColor: Color(red: 0.2, green: 0.6, blue: 0.8))
                        
                        MessageBubble(content: "Yes, it is! We should plan something fun.", alignment: .leading, backgroundColor: Color(red: 0.9, green: 0.9, blue: 0.9))
                        
                        MessageBubble(content: "Definitely! How about going hiking this weekend?", alignment: .trailing, backgroundColor: Color(red: 0.2, green: 0.6, blue: 0.8))
                    }
                    .padding(.horizontal)
                    .padding(.top, 16) // Add padding at the top
                }
                
                Divider()
                
                HStack {
                    TextField("Type a message", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {}) {
                        Image(systemName: "paperplane.fill")
                            .imageScale(.large)
                            .foregroundColor(.clear)
                            .background(
                                Image("messagebg")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            )
                    }
                }

                .padding(.horizontal)
                .padding(.bottom)
            }
            .navigationBarTitle("Chat", displayMode: .inline)
        }
    }
}

struct MessageBubble: View {
    var content: String
    var alignment: BubbleAlignment
    var backgroundColor: Color
    
    var body: some View {
        HStack {
            if alignment == .leading {
                Image("exploreImg3") // Replace with your image name
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .padding(.trailing, 8)
            }
            
            Text(content)
                .foregroundColor(.black)
                .padding()
                .background(backgroundColor)
                .cornerRadius(16)
            
            if alignment == .trailing {
                Image("exploreImg5") // Replace with your image name
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .padding(.leading, 8)
            }
        }
    }
}

enum BubbleAlignment {
    case leading
    case trailing
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}

extension MessageBubble {
    func withGradient(_ gradient: Gradient) -> some View {
        self.background(LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing))
    }
}
