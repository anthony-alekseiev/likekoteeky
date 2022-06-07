//
//  CatsImagesEndpoint.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 06.06.2022.
//

import Foundation

enum CatsImagesEndpoint {
    static let baseURL = URL(string: kApiBaseUrl)!
    static let apiToken = kLikekoteekyApiToken
    
    case searchImages(params: SearchCatImagesRequest)
    
    var urlRequest: CatsAPIUrlRequest {
        switch self {
        case .searchImages(let params):
            var baseQueryURL = URLComponents(
                url: CatsImagesEndpoint.baseURL.appendingPathComponent("/images/search"),
                resolvingAgainstBaseURL: false
            )!
            baseQueryURL.queryItems = [
                URLQueryItem(name: "limit", value: String(params.limit)),
                URLQueryItem(name: "page", value: String(params.page)),
                URLQueryItem(name: "order", value: params.order.rawValue),
                URLQueryItem(name: "size", value: params.size.rawValue)
            ]
            var request = URLRequest(
                url: baseQueryURL.url!,
                cachePolicy: .reloadIgnoringLocalCacheData,
                timeoutInterval: 10
                )
            request.addValue(CatsImagesEndpoint.apiToken, forHTTPHeaderField: "x-api-key")
            return CatsAPIUrlRequest(urlSessionRequest: request)
        }
    }
}
