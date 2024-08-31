//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

import Foundation

public enum ResponseError: Error, Equatable {
    case canNotConnectToServer
    case serverError
    case unableToDecodeResponse
    case server(message: String)
    
    public static func ==(lhs: ResponseError, rhs: ResponseError) -> Bool {
        switch (lhs, rhs) {
        case (.canNotConnectToServer, .canNotConnectToServer),
            (.serverError, .serverError),
            (.unableToDecodeResponse, .unableToDecodeResponse):
            return true
        case (.server(let lhsMessage), .server(let rhsMessage)):
            return lhsMessage == rhsMessage
        default:
            return false
        }
    }
}

extension ResponseError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .canNotConnectToServer:
            return "Can not send request, please check your connection."
        case .serverError:
            return "There is an error in our servers, and we are working on it. Please try again later."
        case .unableToDecodeResponse:
            return "An unexpected error occurred, and we are working on it. Please try again later."
        case .server(let message):
            return message
        }
    }
}

