//
//  HomeView.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 25/08/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
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
                    if viewModel.trendingMovies.isEmpty {
                        CustomProgressView()
                    } else {
                        ScrollView(.horizontal) {
                            LazyHStack {
                                ForEach(viewModel.trendingMovies.prefix(10)) { movie in
                                    MovieCardView(movie: movie)
                                        .padding(.trailing)
                                }
                            }
                        }
                        .contentMargins(24, for: .scrollContent)
                        .scrollTargetBehavior(.viewAligned)
                    }
                    
                    HomeCategoryView(
                        viewModel: viewModel,
                        shouldRefresh: $shouldRefresh
                    )
                }
                .task {
                    await viewModel.fetchTrendingMovies()
                }
                .refreshable {
                    viewModel.clearFetchedMovies()
                    await viewModel.fetchTrendingMovies()
                    
                    shouldRefresh = true
                }
            } else {
                ScrollView() {
                    LazyVStack {
                        ForEach(viewModel.searchedMovies.prefix(10)) { movie in
                            MovieCardView(movie: movie)
                                .padding(.trailing)
                        }
                    }
                }
            }
        }
        .onChange(of: searchText) {
            Task {
                await viewModel.fetchSearchedMovies(query: searchText)
            }
        }
    }
}

#Preview {
    HomeView()
}
