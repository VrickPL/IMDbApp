//
//  DetailedMovieView.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 26/08/2024.
//

import SwiftData
import SwiftUI

struct DetailedMovieView: View {
    @Environment(\.modelContext) private var context
    @Query private var watchList: [MovieData]

    @Binding var movie: Movie?

    init(movie: Binding<Movie?>) {
        self._movie = movie

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.background
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.foreground
        ]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        NavigationView {
            VStack {
                HeaderView(movie: movie)

                VStack {
                    HStack(spacing: 3) {
                        Image(systemName: "calendar")
                        Text(Utils.getYear(from: movie?.releaseDate))

                        Text("  |  ")
                            .font(.title3)

                        Image(systemName: "chart.line.uptrend.xyaxis")
                        Text(Utils.getFormattedDouble(for: movie?.popularity))

                        Text("  |  ")
                            .font(.title3)

                        Image(systemName: "movieclapper")
                        Text(Utils.getFormattedGenre(for: movie))
                    }
                    .font(.callout)
                    .foregroundStyle(.gray)
                    .lineLimit(1)
                    .truncationMode(.tail)

                    DetailedMovieCategoryView(movie: movie)
                        .padding(.top, 20)
                }
                .offset(y: aboutMovieOffsetY)
                .padding(.horizontal, 32)

                Spacer()
            }
            .background(Color.background)
            .navigationBarItems(
                leading: Button {
                    movie = nil
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.foreground)
                }
            )
            .navigationBarTitle("Detail", displayMode: .inline)
            .navigationBarItems(
                trailing: Button {
                    if isInWatchList {
                        removeFromWatchList()
                    } else {
                        addToWatchList()
                    }
                } label: {
                    Image(
                        systemName: isInWatchList ? "bookmark.fill" : "bookmark"
                    )
                    .foregroundStyle(Color.foreground)
                }
            )
        }
    }

    private var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }

    private var aboutMovieOffsetY: CGFloat {
        return screenHeight * 0.1
    }

    private var isInWatchList: Bool {
        return if let movie = movie {
            watchList.contains(where: { $0.id == movie.id })
        } else {
            false
        }
    }

    private func addToWatchList() {
        if let movie = movie {
            context.insert(movie.toMovieData())
        }
    }

    private func removeFromWatchList() {
        if let movie = movie {
            if let movieDataToRemove = watchList.first(where: { $0.id == movie.id }) {
                context.delete(movieDataToRemove)
            }
        }
    }
}

#Preview {
    DetailedMovieView(
        movie: .constant(
            Movie(
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
    )
}
