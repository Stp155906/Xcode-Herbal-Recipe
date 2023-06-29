//
//  SearchView.swift
//  HerbSampleApp
//
//  Created by Shantalia Z on 5/22/23.
//

import SwiftUI

struct SearchView: View {
    
    @State var text = ""
    
    
    var body: some View {
        
        NavigationView{
            List(0..<5){item in
                Text("Herbal Tea Recipes")
            }
            .navigationTitle("Search")
            .searchable(text: $text)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
