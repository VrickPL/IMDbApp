//
//  GenresManager.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 26/08/2024.
//

import Foundation

class GenreManager {
    static let shared = GenreManager()
    private let networkService = NetworkService()
    
    private var genres: [Genre] = []
    
    private init() {}
    
    func fetchGenres() async {
        do {
            let genreResponse: GenreResponse = try await networkService.fetchData(api: ApiConstructor(endpoint: .genre))
            DispatchQueue.main.async {
                self.genres = genreResponse.genres
            }
        } catch {
            print("error: \(error)")
        }
    }
    
    func getGenre(for id: Int?) -> Genre? {
        guard let id = id else {
            return nil
        }
        return genres.first { $0.id == id }
    }
    
    func getAllGenres() -> [Genre] {
        return genres
    }
}
