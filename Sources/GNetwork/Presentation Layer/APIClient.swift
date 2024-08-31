//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

// Presentation layer would use the NetworkUseCase to make requests.

import Foundation

@available(iOS 13.0.0, *)
public struct APIClient {
    private let networkUseCase: NetworkUseCase
    
    public init(networkUseCase: NetworkUseCase = DefaultNetworkUseCase()) {
        self.networkUseCase = networkUseCase
    }
    
    public func fetchData<T: Decodable>(
        method: RequestMethod,
        parameters: APIParameters? = nil,
        domain: String,
        endpoint: String,
        model: T.Type,
        headerType: RequestHeaderType = .unauthorized,
        uploads: [UploadData]? = nil,
        progress: ((_ progress: Int) -> Void)? = nil
    ) async throws -> T {
        return try await networkUseCase.executeRequest(
            method: method,
            parameters: parameters,
            domain: domain,
            endpoint: endpoint,
            model: model,
            headerType: headerType,
            uploads: uploads,
            progress: progress
        )
    }
}

