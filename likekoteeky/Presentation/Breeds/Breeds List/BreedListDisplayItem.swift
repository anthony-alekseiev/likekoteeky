//
//  BreedListDisplayItem.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 07.06.2022.
//

import Foundation
import SwiftUI

class BreedListDisplayItem: Identifiable {
    var id: String
    var name: String
    var description: String
    var image: UIImage?
    
    init(
        id: String,
        name: String,
        description: String,
        image: UIImage? = nil
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.image = image
    }
}
