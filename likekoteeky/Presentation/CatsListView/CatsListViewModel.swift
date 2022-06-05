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
    init(imageLoader: ImageLoader) {
        self.imageLoader = imageLoader
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
    
    func reloadCatItems(with newImage: LoadedCatImage) {
        let catItem = catItems.first(where: { $0.id == newImage.cat.id })
        if let img = newImage.image {
            catItem?.image = img
            self.objectWillChange.send()
        }
        
    }
    
    func fetchCats() {
        let url = URL(string: "https://api.thecatapi.com/v1/images/search?limit=10&page=0&order=desc&size=med")!
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue(kLikekoteekyApiToken, forHTTPHeaderField: "x-api-key")
        URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .print("network call")
            .map(\.data)
            .decode(type: [Cat].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .sink(receiveValue: { [weak self] cats in
                self?.reloadCatItems(with: cats)
            }).store(in: &subscriptions)
    }
}
