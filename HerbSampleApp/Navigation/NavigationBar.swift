//
//  NavigationBar.swift
//  HerbSampleApp
//
//  Created by Shantalia Z on 5/22/23.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        SearchView()
            .tabItem {
                Image(systemName: "gearshape.fill")
                Text("Settings")
            }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
