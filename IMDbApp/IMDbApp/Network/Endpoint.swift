//
//  Endpoint.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 24/08/2024.
//

import Foundation

enum Endpoint {
    static let apiBaseUrl = "https://api.themoviedb.org"
    static let imageBaseUrl = "https://image.tmdb.org/t/p/original"
    
    case nowPlaying, upcoming, trending, topRated, genre, movieReviews(_ movieId: Int)
    
    private var path: String {
        return switch self {
        case .nowPlaying:
            "/3/movie/now_playing"
        case .upcoming:
            "/3/movie/upcoming"
        case .trending:
            "/3/trending/movie/week"
        case .topRated:
            "/3/movie/top_rated"
        case .genre:
            "/3/genre/movie/list"
        case .movieReviews(let movieId):
            "/3/movie/\(movieId)reviews"
        }
    }
    
    var fullPath: String {
        return Endpoint.apiBaseUrl + path
    }
}
