//
//  CatsServiceClient.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 06.06.2022.
//

import Foundation
import Combine

extension CatsAPIClient: CatsImagesService {
    func getCatImages(request: SearchCatImagesRequest) -> AnyPublisher<SearchCatImagesResponse, CatsServiceError> {
        let request = CatsImagesEndpoint.searchImages(params: request).urlRequest
        return wrappedRequest(urlRequest: request)
    }
}
