//
//  DetailedMovieCategoryView.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 26/08/2024.
//

import SwiftUI

struct DetailedMovieCategoryView: View {
    let movie: Movie?

    private let viewModel = DetailedMovieViewModel()

    @State private var selectedCategory = MovieDetailsCategory.aboutMovie

    var body: some View {
        VStack {
            MovieDetailsCategoryPicker(
                selectedCategory: $selectedCategory
            )
            .padding(.bottom)

            ScrollView {
                switch selectedCategory {
                case .aboutMovie:
                    Text(movie?.overview ?? "")
                case .reviews:
                    LazyVStack {
                        if viewModel.reviews.isEmpty {
                            CustomProgressView()
                        } else {
                            ForEach(viewModel.reviews) { review in
                                ReviewView(review: review)
                                    .padding(.vertical, 8)

                                Rectangle()
                                    .fill(Color.foreground)
                                    .frame(height: 1)
                            }
                        }
                    }
                    .task {
                        if let movieId = movie?.id {
                            await viewModel.fetchReviews(movieId: movieId)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    DetailedMovieCategoryView(
        movie: Movie(
            backdropPath: "/avedvodAZUcwqevBfm8p4G2NziQ.jpg",
            genreIds: [18, 80],
            id: 278,
            overview:
                "Imprisoned in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
            posterPath: "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg",
            popularity: 1,
            releaseDate: "1994-09-23",
            title: "The Shawshank Redemption",
            voteAverage: 8.705
        )
    )
}
