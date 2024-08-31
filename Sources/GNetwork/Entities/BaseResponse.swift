//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

import Foundation

public struct BaseResponse<T: Decodable>: Decodable {
    public var key: ServerResponseKey
    public var message: String
    public var data: T?
    
    enum CodingKeys: String, CodingKey {
        case key
        case message = "msg"
        case data
    }
}


