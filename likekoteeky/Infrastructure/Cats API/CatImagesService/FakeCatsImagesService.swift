//
//  FakeCatsService.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 06.06.2022.
//

import Foundation
import Combine

class FakeCatsImagesService: CatsImagesService {
    let publisher = PassthroughSubject<SearchCatImagesResponse, CatsServiceError>()
    var response = SearchCatImagesResponse()
    
    init(response: SearchCatImagesResponse) {
        self.response = response
    }
    
    func getCatImages(request: SearchCatImagesRequest) -> AnyPublisher<SearchCatImagesResponse, CatsServiceError> {
        publisher.send(response)
        return publisher.eraseToAnyPublisher()
    }
}
