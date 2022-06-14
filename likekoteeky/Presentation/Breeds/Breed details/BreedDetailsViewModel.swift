//
//  BreedDetailsViewModel.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 14.06.2022.
//

import Foundation

class BreedDetailsViewModel: ObservableObject {
    
    @Published var breedItem: BreedDisplayItem
    
    init(breedItem: BreedDisplayItem) {
        self.breedItem = breedItem
    }
}
