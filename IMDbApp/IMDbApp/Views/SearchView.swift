//
//  SearchView.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 25/08/2024.
//

import SwiftUI

struct SearchView: View {
    @State private var viewModel = SearchViewModel()
    @State private var searchText = ""

    var body: some View {
        VStack {
            SearchBarView(searchText: $searchText)
                .padding()

            if !searchText.isEmpty {
                if viewModel.searchedMovies.isEmpty {
                    Spacer()
                    CustomProgressView()
                } else {
                    ScrollView {
                        ForEach(viewModel.searchedMovies) { movie in
                            MovieCardDetailedView(movie: movie)
                        }
                    }
                }
            }
            Spacer()
        }
        .onChange(of: searchText) {
            if searchText.isEmpty {
                viewModel.clearSearchedMovies()
            } else {
                Task {
                    await viewModel.fetchSearchedMovies(query: searchText)
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
