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
    let backdropPath: String
    let genreIds: [Int]
    let id: Int
    let overview: String
    let posterPath: String
    let popularity: Double
    let releaseDate: String
    let title: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id
        case overview
        case posterPath = "poster_path"
        case popularity
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
    }
}

extension Movie {
    var imageUrlString: String {
        Endpoint.imageBaseUrl + posterPath
    }

    var backdropImageUrlString: String {
        Endpoint.imageBaseUrl + backdropPath
    }
    
    func toMovieData() -> MovieData {
        return MovieData(
            backdropPath: backdropPath,
            genreIds: genreIds,
            id: id,
            overview: overview,
            posterPath: posterPath,
            popularity: popularity,
            releaseDate: releaseDate,
            title: title,
            voteAverage: voteAverage
        )
    }
}
