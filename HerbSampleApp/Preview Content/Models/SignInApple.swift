//
//  SignInApple.swift
//  HerbSampleApp
//
//  Created by Shantalia Z on 5/25/23.
//  Helper Function

import Foundation
import CryptoKit
import AuthenticationServices

// Struct to hold the result of Sign in with Apple
struct SignInAppleResult {
    let idToken: String
    let nonce: String
}

class SignInApple: NSObject {
    
    // Unhashed nonce.
    private var currentNonce: String?
    private var completionHandler: ((Result<SignInAppleResult, Error>) -> Void)?
    
    // Start Sign in with Apple flow
    func startSignInWithAppleFlow(completion: @escaping (Result<SignInAppleResult, Error>) -> Void) {
        // Get the top view controller
        guard let topVC = UIApplication.getTopViewController() else {
            completion(.failure(NSError()))
            return
        }
        
        // Generate a nonce
        let nonce = randomNonceString()
        currentNonce = nonce
        let completionHandler = completion
        
        // Create a request for Sign in with Apple
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
        
        // Create an authorization controller and perform the request
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = topVC
        authorizationController.performRequests()
    }
    
    // Generate a random nonce string
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        var randomBytes = [UInt8](repeating: 0, count: length)
        let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
        if errorCode != errSecSuccess {
            fatalError(
                "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
        }
        
        let charset: [Character] = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        
        let nonce = randomBytes.map { byte in
            // Pick a random character from the set, wrapping around if needed.
            charset[Int(byte) % charset.count]
        }
        
        return String(nonce)
    }
    
    // Calculate SHA256 hash of a string
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
}

extension SignInApple: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    // Provide the presentation anchor for the authorization controller
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return ASPresentationAnchor(frame: .zero)
    }
    
    // Handle completion of authorization
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = currentNonce, let completion = completionHandler else {
                fatalError("Invalid state: A login callback was received, but no login request was sent.")
            }
            
            // Fetch the identity token
            guard let appleIDToken = appleIDCredential.identityToken else {
                print("Unable to fetch identity token")
                completion(.failure(NSError()))
                return
            }
            
            // Serialize the token string
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                completion(.failure(NSError()))
                return
            }
            
            // Create SignInAppleResult and call completion handler
            let appleResult = SignInAppleResult(idToken: idTokenString, nonce: nonce)
            completion(.success(appleResult))
        }
    }
    
    // Handle error during authorization
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
        print("Sign in with Apple errored: \(error)")
    }
}

extension UIViewController: ASAuthorizationControllerPresentationContextProviding {
    // Provide the presentation anchor for the authorization controller
    public func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

extension UIApplication {
    // Get the top view controller
    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)
        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}

