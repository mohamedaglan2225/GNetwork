//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

// NetworkRepository.swift
import Foundation

@available(iOS 13.0.0, *)
public protocol NetworkRepository {
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
public struct DefaultNetworkRepository: NetworkRepository {
    private let dataSource: NetworkDataSource
    
    public init(dataSource: NetworkDataSource = DefaultNetworkDataSource()) {
        self.dataSource = dataSource
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
        return try await dataSource.request(
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

