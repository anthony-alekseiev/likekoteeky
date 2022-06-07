//
//  CatsAPIClient.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 07.06.2022.
//

import Foundation
import Combine


class CatsAPIClient {
    let apiSession = URLSession.shared
    
    func wrappedRequest<Response: Decodable>(urlRequest: CatsAPIUrlRequest) -> AnyPublisher<Response, CatsServiceError> {
        return apiSession
            .dataTaskPublisher(for: urlRequest.urlSessionRequest)
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
