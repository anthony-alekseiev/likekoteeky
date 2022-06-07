//
//  BreedsServiceImplementation.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 07.06.2022.
//

import Foundation
import Combine

extension CatsAPIClient: BreedsService {
    func getbreeds(request: BreedsListRequest) -> AnyPublisher<BreedsListResponse, CatsServiceError> {
        let request = BreedsEndpoint.getBreeds(params: request).urlRequest
        return wrappedRequest(urlRequest: request)
    }
}
