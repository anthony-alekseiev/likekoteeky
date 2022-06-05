//
//  FakeImageLoader.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 04.06.2022.
//

import Foundation
import Combine

struct FakeImageLoader: ImageLoader {
    let publisher = PassthroughSubject<LoadedCatImage, Never>()
    var images = [LoadedCatImage]()
    
    init(images: [LoadedCatImage]) {
        self.images = images
    }
    
    func loadImages(for cats: [Cat]) -> AnyPublisher<LoadedCatImage, Never> {
        images.forEach { publisher.send($0) }
        return publisher.eraseToAnyPublisher()
    }
}
