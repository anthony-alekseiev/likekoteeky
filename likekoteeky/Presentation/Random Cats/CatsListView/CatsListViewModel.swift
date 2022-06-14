//
//  CatsListViewModel.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 04.06.2022.
//

import Foundation
import Combine
import SwiftUI

class CatsListViewModel: ObservableObject {
    
    private var cats: [Cat] = []
    @Published var catItems: [CatListDisplayItem] = []
    private var subscriptions = [AnyCancellable]()
    
    let imageLoader: ImageLoader
    let catsService: CatsImagesService
    init(imageLoader: ImageLoader, catsService: CatsImagesService) {
        self.imageLoader = imageLoader
        self.catsService = catsService
    }
    
    private func reloadCatItems(with newCats: [Cat]) {
        self.cats = newCats
        catItems = newCats.map {
            CatListDisplayItem(id: $0.id)
        }
        imageLoader.loadImages(for: newCats)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] image in
                self?.reloadCatItems(with: image)
            }).store(in: &subscriptions)
    }
    
    func reloadCatItems(with newImage: ImageLoadingResult) {
        let catItem = catItems.first(where: { $0.id == newImage.source.id })
        if let img = newImage.image {
            catItem?.image = img
            self.objectWillChange.send()
        }
        
    }
    
    func fetchCats() {
        guard cats.isEmpty else { return }
        let request = SearchCatImagesRequest(
            limit: 10,
            page: 0,
            order: .desc,
            size: .med
        )
        catsService.getCatImages(request: request)
            .map {
                $0.map { Cat(id: $0.id, url: $0.url) }
            }
            .receive(on: DispatchQueue.main)
            .sink { completion in
                // TODO: - Handle error
            } receiveValue: { [weak self] value in
                self?.reloadCatItems(with: value)
            }
            .store(in: &subscriptions)
    }
}
