//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

import Foundation

public enum ServerResponseKey: String, Decodable {
    case success
    case fail
    case unauthenticated = "unauthorized"
    case needActive
    case exception
    case blocked
}
