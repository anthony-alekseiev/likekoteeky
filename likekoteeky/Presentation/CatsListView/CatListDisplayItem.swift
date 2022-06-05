//
//  CatListDisplayItem.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 04.06.2022.
//

import Foundation
import SwiftUI

class CatListDisplayItem: Identifiable, Equatable {
    static func == (lhs: CatListDisplayItem, rhs: CatListDisplayItem) -> Bool {
        lhs.id == rhs.id
    }
    
    var id: String
    var image: UIImage?
    
    init(
        id: String,
        image: UIImage? = nil
    ) {
        self.id = id
        self.image = image
    }
}
