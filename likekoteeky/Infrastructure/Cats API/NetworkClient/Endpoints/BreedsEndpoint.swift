//
//  BreedsEndpoint.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 07.06.2022.
//

import Foundation

enum BreedsEndpoint {
    static let baseURL = URL(string: kApiBaseUrl)!
    static let apiToken = kLikekoteekyApiToken
    
    case getBreeds(params: BreedsListRequest)
    
    var urlRequest: CatsAPIUrlRequest {
        switch self {
        case .getBreeds(let params):
            var baseQueryURL = URLComponents(
                url: CatsImagesEndpoint.baseURL.appendingPathComponent("/breeds"),
                resolvingAgainstBaseURL: false
            )!
            baseQueryURL.queryItems = [
                URLQueryItem(name: "limit", value: String(params.limit)),
                URLQueryItem(name: "page", value: String(params.page)),
            ]
            var request = URLRequest(
                url: baseQueryURL.url!,
                cachePolicy: .reloadIgnoringLocalCacheData,
                timeoutInterval: 10
                )
            request.addValue(
                CatsImagesEndpoint.apiToken,
                forHTTPHeaderField: "x-api-key"
            )
            return CatsAPIUrlRequest(urlSessionRequest: request) 
        }
    }
    
}
