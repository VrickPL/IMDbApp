//
//  HomeCategoryView.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 25/08/2024.
//

import SwiftUI

struct HomeCategoryView: View {
    @State var viewModel: HomeViewModel
    @Binding var shouldRefresh: Bool
    @Binding var selectedMovie: Movie?

    @State private var selectedCategory: MovieCategory = .nowPlaying

    private let categoryColumns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    private var moviesForSelectedCategory: [Movie] {
        switch selectedCategory {
        case .nowPlaying:
            viewModel.nowPlayingMovies
        case .upcoming:
            viewModel.upcomingMovies
        case .topRated:
            viewModel.topRatedMovies
        case .popular:
            viewModel.trendingMovies
        }
    }

    var body: some View {
        VStack {
            MovieCategoryPicker(selectedCategory: $selectedCategory)
            
            if moviesForSelectedCategory.isEmpty {
                CustomProgressView()
            } else {
                LazyVGrid(columns: categoryColumns) {
                    ForEach(moviesForSelectedCategory) { movie in
                        MovieCardView(scale: 0.7, movie: movie)
                            .padding(.bottom)
                            .onTapGesture{
                                selectedMovie = movie
                            }
                    }
                }
                .padding(.horizontal)
            }
        }
        .task {
            await fetchBasedOnCurrentCategory()
        }
        .onChange(of: selectedCategory) {
            Task {
                await fetchBasedOnCurrentCategory()
            }
        }
        .onChange(of: shouldRefresh) {
            if shouldRefresh {
                Task {
                    await fetchBasedOnCurrentCategory()
                    shouldRefresh = false
                }
            }
        }
    }
    
    private func fetchBasedOnCurrentCategory() async {
        switch selectedCategory {
        case .nowPlaying:
            if viewModel.nowPlayingMovies.isEmpty {
                await viewModel.fetchNowPlayingMovies()
            }
        case .upcoming:
            if viewModel.upcomingMovies.isEmpty {
                await viewModel.fetchUpcomingMovies()
            }
        case .topRated:
            if viewModel.topRatedMovies.isEmpty {
                await viewModel.fetchTopRatedMovies()
            }
        case .popular:
            if viewModel.trendingMovies.isEmpty {
                await viewModel.fetchTrendingMovies()
            }
        }
    }
}

#Preview {
    HomeCategoryView(
        viewModel: HomeViewModel(),
        shouldRefresh: .constant(false),
        selectedMovie: .constant(nil)
    )
}
