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
    var releaseDate: String
    var runtime: Int?
    var title: String
    var voteAverage: Double
    
    init(
        backdropPath: String,
        genreIds: [Int],
        id: Int,
        overview: String,
        posterPath: String,
        releaseDate: String,
        runtime: Int? = nil,
        title: String,
        voteAverage: Double
    ) {
        self.backdropPath = backdropPath
        self.genreIds = genreIds
        self.id = id
        self.overview = overview
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.runtime = runtime
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
            releaseDate: releaseDate,
            runtime: runtime,
            title: title,
            voteAverage: voteAverage
        )
    }
}
