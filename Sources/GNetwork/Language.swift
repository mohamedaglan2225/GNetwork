//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 8/31/24.
//

import Foundation

public struct Language {
    private init() {}
    
    public static func apiLanguage() -> String {
        // Implement logic to detect and return language code, e.g., "en" for English, "ar" for Arabic.
        return Locale.current.languageCode ?? "en"
    }
}

