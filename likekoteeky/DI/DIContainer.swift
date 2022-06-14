//
//  DIContainer.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 14.06.2022.
//

import Foundation

class DIContainer {
    let imageLoader: ImageLoader = LikeKoteekyImageLoader()
    let apiClient = CatsAPIClient()
    let breedsCoordinatorViewModel = BreedsCoordinatorViewModel()
    
    var catsImagesService: CatsImagesService {
        apiClient
    }
    
    var breedsService: BreedsService {
        apiClient
    }
    
    var catListViewModel: CatsListViewModel {
        CatsListViewModel(
            imageLoader: imageLoader,
            catsService: catsImagesService
        )
    }
    
    func provideBreedsListViewModel() -> BreedsViewModel {
        BreedsViewModel(
            imageLoader: imageLoader,
            breedsService: breedsService
        )
    }
    
    func provideBreedDetails(_ breedItem: BreedDisplayItem) -> BreedDetailsView {
        BreedDetailsView(
            viewModel: BreedDetailsViewModel(
                breedItem: breedItem
            )
        )
    }
    
    func provideBreedsListView() -> BreedsView {
        BreedsView(
            viewModel: provideBreedsListViewModel(),
            breedDetailsProvider: provideBreedDetails(_:)
        )
    }
    
    var catListView: CatsListView {
        CatsListView(
            viewModel: catListViewModel
        )
    }
    
    var breedsCoordinator: BreedsCoordinatorView {
        BreedsCoordinatorView(
            viewModel: breedsCoordinatorViewModel,
            breedsListProvider: provideBreedsListView
        )
    }
    
    
}
