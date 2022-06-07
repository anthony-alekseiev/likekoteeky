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
//    private var breeds: []
    @Published var breedItems: [BreedListDisplayItem] = []
    
    let imageLoader: ImageLoader
    let breedsService: BreedsService
    init(imageLoader: ImageLoader, breedsService: BreedsService) {
        self.imageLoader = imageLoader
        self.breedsService = breedsService
    }
}
