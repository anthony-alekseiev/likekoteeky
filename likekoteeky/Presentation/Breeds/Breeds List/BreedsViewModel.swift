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
    @Published var breeds: [BreedListDisplayItem] = [
        BreedListDisplayItem(
            id: "meow",
            name: "Niceone",
            description: "Very nice and cute little one!",
            image: nil
        ),
        BreedListDisplayItem(
            id: "hellokitty",
            name: "Hello Kitty",
            description: "Cheep, cheep! Hello Kitty looks so cute all dolled up as a baby chick. The fuzzy texture is super soft and cuddly.",
            image: UIImage(named: "cat_placeholder")
        )
    ]
}
