//
//  likekoteekyApp.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 04.06.2022.
//

import SwiftUI

@main
struct likekoteekyApp: App {
    
    let diContainer = DIContainer()
    
    var body: some Scene {
        
        WindowGroup {
            MenuCoordinatorView(
                breedsView: diContainer.breedsCoordinator,
                catListView: diContainer.catListView
            )
        }
    }
}
