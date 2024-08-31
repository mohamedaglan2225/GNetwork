//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

import Foundation
import Alamofire

public protocol Requestable: RequestConvertible {
    associatedtype Response: Decodable
    
    var server: String { get }
    var method: RequestMethod { get }
    var path: String { get }
    var headerType: RequestHeaderType { get }
    var queries: APIParameters? { get }
    var body: APIParameters? { get }
    var uploads: [UploadData]? { get }
    var decoder: ResponseDecoder { get }
    
    func asURLRequest() throws -> URLRequest
}

extension Requestable {
    public func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: try server.asURL().appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        for header in headerType.header {
            urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
        }
        
        if let queries = queries?.compactMapValues({ $0 }) {
            urlRequest = try URLRequestEncoding.default.encode(urlRequest, with: queries)
        }
        
        if let body = body?.compactMapValues({ $0 }) {
            urlRequest = try JSONRequestEncoding.default.encode(urlRequest, with: body)
        }
        
        #if DEBUG
        print(
              """
              
              ====================================
              🚀🚀FULL REQUEST COMPONENTS:::
              
              URL:: \(urlRequest.url?.absoluteString ?? "No URL Found")
              ---------------------------------
              Method:: \(urlRequest.httpMethod ?? "No httpMethod")
              ---------------------------------
              Header::
              \((urlRequest.allHTTPHeaderFields ?? [:]).json())
              ---------------------------------
              Queries::
              \((queries?.compactMapValues({$0}) ?? [:]).json())
              ---------------------------------
              Body::
              \((body?.compactMapValues({$0}) ?? [:]).json())
              
              ====================================
              
              """
        )
        #endif
        
        return urlRequest
    }
}
