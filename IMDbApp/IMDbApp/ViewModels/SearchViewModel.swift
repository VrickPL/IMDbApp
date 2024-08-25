//
//  SearchViewModel.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 25/08/2024.
//

import Foundation
import Observation

@Observable
class SearchViewModel {
    var searchedMovies: [Movie] = []
    
    private let movieService = NetworkService()
    
    func fetchSearchedMovies(query: String) async {
        do {
            let parameters: [String: String] = ["query": query]
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .search, parameters: parameters))

            DispatchQueue.main.async {
                self.searchedMovies = movieApiResponse.results
            }
        } catch {
            print("error: \(error)")
        }
    }
    
    func clearSearchedMovies() {
        searchedMovies = []
    }
}
