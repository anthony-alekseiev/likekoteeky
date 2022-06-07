//
//  LikeKoteekyImageLoader.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 04.06.2022.
//

import SwiftUI
import Combine

struct LikeKoteekyImageLoader: ImageLoader {
    
    init() {
        
    }
    
    func loadImages(for cats: [Cat]) -> AnyPublisher<LoadedCatImage, Never> {
        cats
            .publisher
            .flatMap {
                loadImage(for: $0)
            }
            .eraseToAnyPublisher()
        
    }
    
    private func loadImage(for cat: Cat) -> AnyPublisher<LoadedCatImage, Never> {
        URLSession.shared
            .dataTaskPublisher(for: cat.url)
            .replaceError(with: (Data(), URLResponse.init()))
            .map {
                LoadedCatImage(
                    image: UIImage(data: $0.data),
                    cat: cat
                )
            }
            .eraseToAnyPublisher()
    }
}
