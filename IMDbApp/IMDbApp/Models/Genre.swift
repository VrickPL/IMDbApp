//
//  Genre.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 26/08/2024.
//

import Foundation

// MARK: - GenreResponse
struct GenreResponse: Codable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}
