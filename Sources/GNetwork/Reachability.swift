//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

import Foundation
import Alamofire

public class Reachability {
    private let manager = NetworkReachabilityManager(host: "www.apple.com")
    private(set) public var lastStatus: NetworkReachabilityManager.NetworkReachabilityStatus?
    private var currentStatus: NetworkReachabilityManager.NetworkReachabilityStatus? {
        willSet {
            self.lastStatus = currentStatus
        }
    }
    
    public func listen(onQueue: DispatchQueue = .main, onUpdatePerforming listener: @escaping NetworkReachabilityManager.Listener) {
        manager?.startListening(onQueue: onQueue) { [weak self] status in
            self?.currentStatus = status
            listener(status)
        }
    }
}

