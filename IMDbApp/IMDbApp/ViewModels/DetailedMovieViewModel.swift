//
//  DetailedMovieViewModel.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 26/08/2024.
//

import Foundation
import Observation

@Observable
class DetailedMovieViewModel {
    var reviews: [Review] = []
    
    private let networkService = NetworkService()
    
    func fetchReviews(movieId: Int) async {
        do {
            let reviewApiResponse: ReviewResponse = try await networkService.fetchData(api: ApiConstructor(endpoint: .movieReviews(movieId)))

            DispatchQueue.main.async {
                self.reviews = reviewApiResponse.reviews
            }
        } catch {
            print("error: \(error)")
        }
    }
}
