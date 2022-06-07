//
//  BreedsService.swift
//  likekoteeky
//
//  Created by Anton Aleksieiev on 07.06.2022.
//

import Foundation
import Combine

protocol BreedsService {
    func getbreeds(request: BreedsListRequest) -> AnyPublisher<BreedsListResponse, CatsServiceError>
}
