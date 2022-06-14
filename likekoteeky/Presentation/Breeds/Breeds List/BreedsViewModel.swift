//
//  BreedsViewModel.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 07.06.2022.
//

import Foundation
import Combine
import SwiftUI

class BreedsViewModel: ObservableObject {
    private var breeds: [Breed] = []
    @Published var breedItems: [BreedListDisplayItem] = []
    private var subscriptions = [AnyCancellable]()
    
    let imageLoader: ImageLoader
    let breedsService: BreedsService
    init(imageLoader: ImageLoader, breedsService: BreedsService) {
        self.imageLoader = imageLoader
        self.breedsService = breedsService
    }
    
    private func reloadBreeds(with newBreeds: [Breed]) {
        self.breeds = newBreeds
        breedItems = newBreeds.map {
            BreedListDisplayItem(
                id: $0.id,
                name: $0.name,
                description: $0.description
            )
        }
        imageLoader.loadImages(for: newBreeds)
            .print("[BREEDS]")
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] image in
                self?.reloadBreeds(with: image)
            }).store(in: &subscriptions)
    }
    
    func reloadBreeds(with newImage: ImageLoadingResult) {
        var breedItem = breedItems.first(where: { $0.id == newImage.source.id })
        if let img = newImage.image {
            breedItem?.image = img
            self.objectWillChange.send()
        }
        
    }
    
    func fetchBreeds() {
        let request = BreedsListRequest(limit: 10, page: 0)
        breedsService.getbreeds(request: request)
            .map {
                $0.map {
                    Breed(
                        id: $0.id,
                        name: $0.name,
                        description: $0.description,
                        imageUrl: $0.image.url
                    )
                }
            }.receive(on: DispatchQueue.main)
            .sink { completion in
                // TODO: - Handle error
            } receiveValue: { [weak self] value in
                self?.reloadBreeds(with: value)
            }
            .store(in: &subscriptions)
    }
}
