//
//  SignInView.swift
//  HerbSampleApp
//
//  Created by Shantalia Z on 5/25/23.
//

import SwiftUI

class SignInViewModel: ObservableObject{
    
    func signInWithApple(){
        
    }
    
}

struct SignInView: View {
    
    @StateObject var viewModel = SignInViewModel()
    
    
    let signInApple = SignInApple()
    
    var body: some View {
        Button{
            signInApple.startSignInWithAppleFlow{ result in switch result {
                case .success(let appleResult): print(appleResult)
                case .failure(_):
                    print("error")
                    
                }
            }
        }label: {
            Text("Sign in with Apple")
                .foregroundColor(.black)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
