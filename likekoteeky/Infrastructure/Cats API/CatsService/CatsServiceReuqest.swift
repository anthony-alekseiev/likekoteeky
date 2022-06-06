//
//  CatsServiceReuqest.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 06.06.2022.
//

import Foundation

enum CatsServiceRequest {
    static let baseURL = URL(string: kApiBaseUrl)!
    static let apiToken = kLikekoteekyApiToken
    
    case searchImages(params: SearchCatsRequest)
    
    var urlRequest: URLRequest {
        switch self {
        case .searchImages(let params):
            var baseQueryURL = URLComponents(
                url: CatsServiceRequest.baseURL.appendingPathComponent("/images/search"),
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
            request.addValue(CatsServiceRequest.apiToken, forHTTPHeaderField: "x-api-key")
            return request
        }
    }
}
