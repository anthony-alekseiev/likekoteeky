//
//  CatsService.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 06.06.2022.
//

import Foundation
import Combine

protocol CatsImagesService {
    func getCatImages(request: SearchCatImagesRequest) -> AnyPublisher<SearchCatImagesResponse, CatsServiceError>
}
