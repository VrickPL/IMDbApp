//
//  Movie.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 24/08/2024.
//

import Foundation


// MARK: - MovieResponse
struct MovieResponse: Codable {
    let page: Int
    let results: [Movie]
    let totalResults, totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

// MARK: - Movie
struct Movie: Codable, Identifiable {
    let adult: Bool
    let backdropPath: String
    let budget: Int
    let genres: [Genre]
    let id: Int
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let revenue: Int
    let runtime: Int
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
                case backdropPath = "backdrop_path"
                case budget
                case genres
                case id
                case overview
                case popularity
                case posterPath = "poster_path"
                case releaseDate = "release_date"
                case revenue
                case runtime
                case title
                case video
                case voteAverage = "vote_average"
                case voteCount = "vote_count"
    }
}

extension Movie {
    var imageUrlString: String {
        Endpoint.imageBaseUrl + posterPath
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}
