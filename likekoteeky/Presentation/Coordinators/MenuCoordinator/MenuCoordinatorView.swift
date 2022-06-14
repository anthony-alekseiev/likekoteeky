//
//  MenuCoordinatorView.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 14.06.2022.
//

import SwiftUI

struct MenuCoordinatorView: View {
    
    let breedsView: BreedsCoordinatorView
    let catListView: CatsListView
    
    var body: some View {
        TabView {
            breedsView
                .tabItem {
                    Text("Breeds")
                }
                .tag(1)
            
            catListView
                .tabItem {
                    Text("Random cats")
                }
                .tag(2)
        }
    }
}

struct MenuCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
