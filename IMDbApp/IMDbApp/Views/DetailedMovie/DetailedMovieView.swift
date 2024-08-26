//
//  DetailedMovieView.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 26/08/2024.
//

import SwiftUI

struct DetailedMovieView: View {
    @Binding var movie: Movie?

    @State private var isInWatchList = false

    private var movieGenre: String {
        let genre = GenreManager.shared.getGenre(for: movie?.genreIds.first)

        return if let genre = genre {
            genre.name
        } else {
            "N/A"
        }
    }

    private var movieRuntime: String {
        guard let runtime = movie?.runtime else {
            return "N/A"
        }
        return String(runtime)
    }

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

                        Image(systemName: "clock")
                        Text("\(movieRuntime) minutes")

                        Text("  |  ")
                            .font(.title3)

                        Image(systemName: "movieclapper")
                        Text(movieGenre)
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
                    // TODO: SwiftData add or remove from watchList
                    isInWatchList.toggle()
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
}

#Preview {
    DetailedMovieView(
        movie: .constant(
            Movie(
                adult: false,
                backdropPath: "/avedvodAZUcwqevBfm8p4G2NziQ.jpg",
                genreIds: [18, 80],
                id: 278,
                overview:
                    "Imprisoned in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
                popularity: 166.018,
                posterPath: "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg",
                releaseDate: "1994-09-23",
                runtime: 142,
                title: "The Shawshank Redemption",
                video: false,
                voteAverage: 8.705,
                voteCount: 26685
            )
        )
    )
}
