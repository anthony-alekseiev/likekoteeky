//
//  FakeCatsService.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 06.06.2022.
//

import Foundation
import Combine

class FakeCatsService: CatsService {
    let publisher = PassthroughSubject<[SearchCatsResponse], CatsServiceError>()
    var response = [SearchCatsResponse]()
    
    init(response: [SearchCatsResponse]) {
        self.response = response
    }
    
    func getCats(request: SearchCatsRequest) -> AnyPublisher<[SearchCatsResponse], CatsServiceError> {
        publisher.send(response)
        return publisher.eraseToAnyPublisher()
    }
}
