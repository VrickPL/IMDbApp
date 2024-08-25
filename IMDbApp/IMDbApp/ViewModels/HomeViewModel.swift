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
    
    private let networkService = NetworkService()
    
    func fetchNowPlayingMovies() async {
        do {
            let movieApiResponse: MovieResponse = try await networkService.fetchData(api: ApiConstructor(endpoint: .nowPlaying))
            DispatchQueue.main.async {
                self.nowPlayingMovies = movieApiResponse.results
            }
        } catch {
            print("error: \(error)")
        }
    }
    
    func fetchUpcomingMovies() async {
        do {
            let movieApiResponse: MovieResponse = try await networkService.fetchData(api: ApiConstructor(endpoint: .upcoming))
            DispatchQueue.main.async {
                self.upcomingMovies = movieApiResponse.results
            }
        } catch {
            print("error: \(error)")
        }
    }
    
    func fetchTrendingMovies() async {
        do {
            let movieApiResponse: MovieResponse = try await networkService.fetchData(api: ApiConstructor(endpoint: .trending))
            DispatchQueue.main.async {
                self.trendingMovies = movieApiResponse.results
            }
        } catch {
            print("error: \(error)")
        }
    }
    
    func fetchTopRatedMovies() async {
        do {
            let movieApiResponse: MovieResponse = try await networkService.fetchData(api: ApiConstructor(endpoint: .topRated))
            DispatchQueue.main.async {
                self.topRatedMovies = movieApiResponse.results
            }
        } catch {
            print("error: \(error)")
        }
    }
    
    func clearFetchedMovies() {
        trendingMovies = []
        nowPlayingMovies = []
        upcomingMovies = []
        topRatedMovies = []
    }
}
