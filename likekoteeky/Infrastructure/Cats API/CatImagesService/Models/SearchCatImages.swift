//
//  SearchCats.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 06.06.2022.
//

import Foundation

struct SearchCatImagesRequest {
    enum Order: String {
        case random = "random"
        case asc = "asc"
        case desc = "desc"
    }
    
    enum Size: String {
        case full = "full"
        case med = "med"
        case small = "small"
        case thumb = "thumb"
    }
    
    let limit: Int
    let page: Int
    let order: Order
    let size: Size
}

typealias SearchCatImagesResponse = [SearchCatImagessResponseImage]

struct SearchCatImagessResponseImage: Decodable {
    var id: String
    var url: URL
}
