//
//  ImageLoadingSource.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 14.06.2022.
//

import Foundation

protocol ImageLoadingSource {
    var id: String { get }
    var imageUrl: URL { get }
}

extension Cat: ImageLoadingSource {
    var imageUrl: URL {
        return self.url
    }
}
extension Breed: ImageLoadingSource {}
