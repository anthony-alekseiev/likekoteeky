//
//  BreedsList.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 07.06.2022.
//

import Foundation

struct BreedsListRequest {
    let limit: Int
    let page: Int
}

typealias BreedsListResponse = [BreedsListResponseBreed]

struct BreedsListResponseBreed: Decodable {
    struct Image: Decodable {
        var id: String
        var url: URL
    }
    
    var id: String
    var name: String
    var description: String
    var image: Image
}
