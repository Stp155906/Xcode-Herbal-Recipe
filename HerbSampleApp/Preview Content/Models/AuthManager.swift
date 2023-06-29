//
//  AuthManager.swift
//  HerbSampleApp
//
//  Created by Shantalia Z on 5/25/23.
//

import Foundation

import Supabase

class AuthManager{
    static let shared = AuthManager()
    
    private init() {}
    
    let client = SupabaseClient(supabaseURL: URL(string:"https://qrcunhsodxcovedyfovy.supabase.co")!,
                                supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFyY3VuaHNvZHhjb3ZlZHlmb3Z5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODUwNDMyMjksImV4cCI6MjAwMDYxOTIyOX0.OdwEB0iId5YSzm7ovGp4n80avdCpAOoAl_OmDkoDFz8")
    
    func signInWithApple(idToken: String, nonce: String) async throws {
        let session = try await client.auth.signInWithIdToken (credentials: .init(provider: .apple, idToken: idToken, nonce: nonce))
        
    }
}
