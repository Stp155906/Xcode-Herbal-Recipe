import SwiftUI
import Supabase



class SupabaseManager {
   

    
    
    
    
    func signUp(email: String, password: String) async {
        do {
            try await client.auth.signUp(email: email, password: password)
            let session = try await client.auth.session()
            print("### Session Info: \(session)")
        } catch {
            print("### Sign Up Error: \(error)")
        }
    }
}

