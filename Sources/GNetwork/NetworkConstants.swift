//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

import Foundation

public struct NetworkConstants {
    private init() {}
    public static let domain = "https://b-tower.com"
    public static let port = "4548"
    public static var server: String {
        return domain + "/api/"
    }
    public static var socket: String {
        "\(domain):\(port)"
    }
}

