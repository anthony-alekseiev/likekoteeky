//
//  FakeBreedsService.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 08.06.2022.
//

import Foundation
import Combine

class FakeBreedsService: BreedsService {
    let publisher = PassthroughSubject<BreedsListResponse, CatsServiceError>()
    var response = BreedsListResponse()
    
    init(response: BreedsListResponse) {
        self.response = response
    }
    
    func getbreeds(request: BreedsListRequest) -> AnyPublisher<BreedsListResponse, CatsServiceError> {
        publisher.send(response)
        return publisher.eraseToAnyPublisher()
    }
}

