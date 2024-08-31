//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

import Foundation

@available(iOS 13.0, *)
public protocol NetworkExecuter {
    func execute(_ request: any Requestable, progress progressHandler: ((_ progress: Int) -> Void)?) async throws -> Data
}
