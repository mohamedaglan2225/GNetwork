//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

// NetworkDataSource.swift
import Foundation

@available(iOS 13.0.0, *)
public protocol NetworkDataSource {
    func request<T: Decodable>(
        method: RequestMethod,
        parameters: APIParameters?,
        domain: String,
        endpoint: String,
        model: T.Type,
        headerType: RequestHeaderType,
        uploads: [UploadData]?,
        progress: ((_ progress: Int) -> Void)?
    ) async throws -> T
}

@available(iOS 13.0.0, *)
public struct DefaultNetworkDataSource: NetworkDataSource {
    private let networkManager: NetworkManager
    
    public init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    public func request<T: Decodable>(
        method: RequestMethod,
        parameters: APIParameters? = nil,
        domain: String,
        endpoint: String,
        model: T.Type,
        headerType: RequestHeaderType = .unauthorized,
        uploads: [UploadData]? = nil,
        progress: ((_ progress: Int) -> Void)? = nil
    ) async throws -> T {
        return try await networkManager.request(
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

