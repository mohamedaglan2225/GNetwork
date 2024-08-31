//
//  MockNetworkRepository.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

import XCTest
@testable import GNetwork

@available(iOS 13.0.0, *)
class MockNetworkRepository: NetworkRepository {
    var mockResult: Result<Decodable, Error>?

    func request<T: Decodable>(
        method: RequestMethod,
        parameters: APIParameters?,
        domain: String,
        endpoint: String,
        model: T.Type,
        headerType: RequestHeaderType,
        uploads: [UploadData]?,
        progress: ((_ progress: Int) -> Void)?
    ) async throws -> T {
        switch mockResult {
        case .success(let model as T):
            return model
        case .failure(let error):
            throw error
        default:
            throw ResponseError.serverError
        }
    }
}
