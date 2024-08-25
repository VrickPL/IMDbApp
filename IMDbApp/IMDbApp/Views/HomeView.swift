//
//  HomeView.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 25/08/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var homeViewModel = HomeViewModel()
    @State private var searchViewModel = SearchViewModel()
    @State private var shouldRefresh = false
    
    @State private var searchText = ""

    var body: some View {
        VStack {
            HStack {
                Text("home_view_question")
                    .bold()
                    .font(.title2)

                Spacer()
            }
            .padding()

            SearchBarView(searchText: $searchText)
                .padding(.horizontal)

            if searchText.isEmpty {
                ScrollView {
                    if homeViewModel.trendingMovies.isEmpty {
                        CustomProgressView()
                    } else {
                        ScrollView(.horizontal) {
                            LazyHStack {
                                ForEach(homeViewModel.trendingMovies.prefix(10)) { movie in
                                    MovieCardView(movie: movie)
                                        .padding(.trailing)
                                }
                            }
                        }
                        .contentMargins(24, for: .scrollContent)
                        .scrollTargetBehavior(.viewAligned)
                    }
                    
                    HomeCategoryView(
                        viewModel: homeViewModel,
                        shouldRefresh: $shouldRefresh
                    )
                }
                .task {
                    await homeViewModel.fetchTrendingMovies()
                }
                .refreshable {
                    homeViewModel.clearFetchedMovies()
                    await homeViewModel.fetchTrendingMovies()
                    
                    shouldRefresh = true
                }
            } else {
                ScrollView() {
                    LazyVStack {
                        ForEach(searchViewModel.searchedMovies) { movie in
                            MovieCardDetailedView(movie: movie)
                        }
                    }
                }
            }
        }
        .onChange(of: searchText) {
            if searchText.isEmpty {
                searchViewModel.clearSearchedMovies()
            } else {
                Task {
                    await searchViewModel.fetchSearchedMovies(query: searchText)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
