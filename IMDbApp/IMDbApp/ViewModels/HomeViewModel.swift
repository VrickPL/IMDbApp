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
    var nowPlayingMovies: [Movie] = []
    var upcomingMovies: [Movie] = []
    var trendingMovies: [Movie] = []
    var topRatedMovies: [Movie] = []
    var searchedMovies: [Movie] = []
    
    private let movieService = MovieService()
    
    func fetchNowPlayingMovies() async {
        do {
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .nowPlaying))
            nowPlayingMovies = movieApiResponse.results
        } catch {
            print("error: \(error)")
        }
    }
    
    func fetchUpcomingMovies() async {
        do {
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .upcoming))
            upcomingMovies = movieApiResponse.results
        } catch {
            print("error: \(error)")
        }
    }
    
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
            topRatedMovies = movieApiResponse.results
        } catch {
            print("error: \(error)")
        }
    }
    
    func fetchSearchedMovies(query: String) async {
        do {
            let parameters: [String: String] = ["query": query]
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .search, parameters: parameters))
            searchedMovies = movieApiResponse.results
        } catch {
            print("error: \(error)")
        }
    }
    
    func clearFetchedMovies() {
        trendingMovies = []
        nowPlayingMovies = []
        upcomingMovies = []
        topRatedMovies = []
        searchedMovies = []
    }
}
