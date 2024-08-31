//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

import Foundation

public struct UploadData {
    public var key: String
    public var data: Data
    public var mimeType: mimeType
    public var fileName: String = UUID().uuidString
    public var filenameWithExtension: String {
        "\(fileName)\(mimeType.extension)"
    }
}

public enum mimeType: String {
    case jpeg = "image/jpeg"
    case pdf = "application/pdf"
    case m4a = "audio/x-m4a"
    case mp4 = "video/mp4"
    
    fileprivate var `extension`: String {
        switch self {
        case .jpeg:
            return ".jpeg"
        case .pdf:
            return ".pdf"
        case .m4a:
            return ".m4a"
        case .mp4:
            return ".mp4"
        }
    }
}

