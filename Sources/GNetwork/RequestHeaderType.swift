//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

import Foundation

public enum RequestHeaderType {
    case authorized(token: String)
    case unauthorized
    
    public var header: [String: String] {
        var commonHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json",
            "lang": Language.apiLanguage()
        ]
        
        switch self {
        case .authorized(let token):
            commonHeaders["Authorization"] = "Bearer \(token)"
            return commonHeaders
        case .unauthorized:
            return commonHeaders
        }
    }
}

