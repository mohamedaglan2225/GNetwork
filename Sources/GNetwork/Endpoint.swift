//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

import Foundation
import Alamofire

public struct Endpoint<T: Decodable>: Requestable {
    public typealias Response = T
    
    public let server: String
    public let method: RequestMethod
    public let path: String
    public let queries: APIParameters?
    public let body: APIParameters?
    public let headerType: RequestHeaderType
    public let uploads: [UploadData]?
    public let decoder: ResponseDecoder
    
    public init(
        server: String,
        method: RequestMethod = RequestMethod.get,
        path: String,
        queries: APIParameters? = nil,
        body: APIParameters? = nil,
        headerType: RequestHeaderType = .unauthorized,
        uploads: [UploadData]? = nil,
        decoder: ResponseDecoder = DefaultJSONDecoder()
    ) {
        self.server = server
        self.method = method
        self.path = path
        self.queries = queries
        self.body = body
        self.headerType = headerType
        self.uploads = uploads
        self.decoder = decoder
    }

}
