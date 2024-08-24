//
//  HomeViewModel.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 24/08/2024.
//

import Foundation
import Observation

@Observable
class HomeViewModel {
    var topRatedMovies: [Movie] = []
    var trendingMovies: [Movie] = []
    
    private let movieService = MovieService()
    
    func fetchTrendingMovies() async {
        do {
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .trending))
            trendingMovies = movieApiResponse.results
        } catch {
            print("error: \(error)")
        }
    }
    
    func fetchTopRatedMovies() async {
        do {
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .topRated))
            trendingMovies = movieApiResponse.results
        } catch {
            print("error: \(error)")
        }
    }
}
