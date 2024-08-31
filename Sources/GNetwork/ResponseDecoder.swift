//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

import Foundation

public protocol ResponseDecoder {
    func decode<T: Decodable>(data: Data) throws -> T
}

public struct DefaultJSONDecoder: ResponseDecoder {
    public init() {}
    
    public func decode<T: Decodable>(data: Data) throws -> T {
        do {
            let decoder = JSONDecoder()
            let object = try decoder.decode(T.self, from: data)
            return object
        } catch DecodingError.keyNotFound(let key, let context) {
            print("Could not find key \(key) in JSON: \(context.debugDescription)")
            print(context.codingPath)
            throw ResponseError.unableToDecodeResponse
        } catch DecodingError.valueNotFound(let type, let context) {
            print("Could not find type \(type) in JSON: \(context.debugDescription)")
            print(context.codingPath)
            throw ResponseError.unableToDecodeResponse
        } catch DecodingError.typeMismatch(let type, let context) {
            print("Type mismatch for type \(type) in JSON: \(context.debugDescription)")
            print(context.codingPath)
            throw ResponseError.unableToDecodeResponse
        } catch DecodingError.dataCorrupted(let context) {
            print("Data found to be corrupted in JSON: \(context.debugDescription)")
            print(context.codingPath)
            throw ResponseError.unableToDecodeResponse
        } catch let error as NSError {
            NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
            if error as? ResponseError != nil {
                throw error
            } else {
                throw ResponseError.unableToDecodeResponse
            }
        }
    }
}

