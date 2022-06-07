//
//  CatsServiceClient.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 06.06.2022.
//

import Foundation
import Combine

class CatsServiceClient {
    let apiSession = URLSession.shared
    
    func wrappedRequest<Response: Decodable>(urlRequest: URLRequest) -> AnyPublisher<Response, CatsServiceError> {
        return apiSession
            .dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: Response.self, decoder: JSONDecoder())
            .mapError { error -> CatsServiceError in
                if let err = error as? URLError {
                    if 400..<500 ~= err.errorCode {
                        return .clientError
                    }
                    if err.errorCode > 500 {
                        return .serverError
                    }
                }
                if let _ = error as? DecodingError {
                    return .parsingError
                }
                return .unknownError(msg: error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}

extension CatsServiceClient: CatsService {
    func getCats(request: SearchCatsRequest) -> AnyPublisher<SearchCatsResponse, CatsServiceError> {
        let request = CatsServiceRequest.searchImages(params: request).urlRequest
        return wrappedRequest(urlRequest: request)
    }
}
