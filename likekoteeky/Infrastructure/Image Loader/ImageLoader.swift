//
//  ImageLoader.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 04.06.2022.
//

import Foundation
import Combine

protocol ImageLoader {
    func loadImages(for source: [ImageLoadingSource]) -> AnyPublisher<ImageLoadingResult, Never>
}
