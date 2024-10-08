//
//  MovieData.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 27/08/2024.
//

import Foundation
import SwiftData

@Model
class MovieData: Identifiable, Equatable {
    var backdropPath: String
    var genreIds: [Int]
    var id: Int
    var overview: String
    var posterPath: String
    var popularity: Double
    var releaseDate: String
    var title: String
    var voteAverage: Double
    
    init(
        backdropPath: String,
        genreIds: [Int],
        id: Int,
        overview: String,
        posterPath: String,
        popularity: Double,
        releaseDate: String,
        title: String,
        voteAverage: Double
    ) {
        self.backdropPath = backdropPath
        self.genreIds = genreIds
        self.id = id
        self.overview = overview
        self.posterPath = posterPath
        self.popularity = popularity
        self.releaseDate = releaseDate
        self.title = title
        self.voteAverage = voteAverage
    }
    
    func toMovie() -> Movie {
        return Movie(
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
