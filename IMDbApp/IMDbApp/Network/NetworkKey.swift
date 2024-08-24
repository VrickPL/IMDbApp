//
//  NetworkKey.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 24/08/2024.
//

import Foundation

struct NetworkKey {
    static var apiKey: String {
        if let path = Bundle.main.path(forResource: "APIKeys", ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path),
            let apiKey = try? PropertyListSerialization.propertyList(
                from: xml,
                format: nil
            ) as? [String: Any] {
            if let apiKey = apiKey["TMDB_API_KEY"] as? String {
                return apiKey
            }
        }
        return ""
    }
}
