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
        
        let apiClient = CatsAPIClient()
        let catsImagesService: CatsImagesService = apiClient
        let breedsService: BreedsService = apiClient
        
        let catListViewModel = CatsListViewModel(
            imageLoader: imageLoader,
            catsService: catsImagesService
        )
        let breedsViewModel = BreedsViewModel(
            imageLoader: imageLoader,
            breedsService: breedsService
        )
        
        WindowGroup {
//            CatsListView(
//                viewModel: catListViewModel
//            )
            BreedsView(viewModel: breedsViewModel)
        }
    }
}
