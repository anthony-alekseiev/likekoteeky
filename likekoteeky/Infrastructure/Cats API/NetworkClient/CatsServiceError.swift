//
//  CatsServiceError.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 06.06.2022.
//

import Foundation

enum CatsServiceError: LocalizedError {
    case serverError
    case clientError
    case parsingError
    case unknownError(msg: String)
    
    var errorDescription: String? {
        switch self {
        case .serverError:
            return "Something went wrong"
        case .clientError:
            return "Invalid request"
        case .parsingError:
            return "Invalid response"
        case .unknownError(let msg):
            return msg
        }
    }
}
