//
//  likekoteekyApp.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 04.06.2022.
//

import SwiftUI

@main
struct likekoteekyApp: App {
    
    var body: some Scene {
        let imageLoader: ImageLoader = LikeKoteekyImageLoader()
        let catsService: CatsService = CatsServiceClient()
        let catListViewModel = CatsListViewModel(
            imageLoader: imageLoader,
            catsService: catsService
        )
        
        let breedsViewModel = BreedsViewModel()
        
        WindowGroup {
//            CatsListView(
//                viewModel: catListViewModel
//            )
            BreedsView(viewModel: breedsViewModel)
        }
    }
}
