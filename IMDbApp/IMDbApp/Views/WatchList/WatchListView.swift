//
//  WatchListView.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 25/08/2024.
//

import SwiftUI
import SwiftData

struct WatchListView: View {
    @Query private var watchList: [MovieData]
    @State private var selectedMovie: Movie? = nil
    
    var body: some View {
        VStack {
            if watchList.isEmpty {
                Spacer()
                HStack {
                    Spacer()
                    Text(LocalizedStringKey("empty_watch_list"))
                    Spacer()
                }
            } else {
                ScrollView {
                    ForEach(watchList) { movie in
                        MovieCardDetailedView(movie: movie.toMovie())
                            .onTapGesture {
                                selectedMovie = movie.toMovie()
                            }
                    }
                }
            }
            Spacer()
        }
        .fullScreenCover(item: $selectedMovie) { movie in
            DetailedMovieView(movie: $selectedMovie)
        }
    }
}

#Preview {
    WatchListView()
}
