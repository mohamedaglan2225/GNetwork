//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

import Foundation

@available(iOS 13.0.0, *)

public struct NetworkManager {
    
    private let responseHandler: ResponseHandler
    
    public init(responseHandler: ResponseHandler = DefaultResponseHandler()) {
        self.responseHandler = responseHandler
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
        let endpoint = Endpoint<T>(
            server: domain,
            method: method,
            path: endpoint,
            queries: parameters,
            headerType: headerType,
            uploads: uploads
        )
        return try await responseHandler.get(endpoint, progress: progress)
    }
}
