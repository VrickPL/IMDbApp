//
//  MovieCardView.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 25/08/2024.
//

import SwiftUI

struct MovieCardView: View {
    var scale: CGFloat = 1
    let movie: Movie
    var showTitle: Bool = true
    @State var basicCardWidth: CGFloat = 144.61
    @State var basicCardHeight: CGFloat = 210

    private var cardWidth: CGFloat {
        basicCardWidth * scale
    }
    private var cardHeight: CGFloat {
        basicCardHeight * scale
    }

    var body: some View {
        AsyncImage(url: URL(string: movie.imageUrlString)) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            ZStack {
                Color.loadingMovie

                VStack {
                    CustomProgressView()

                    if showTitle {
                        Text(movie.title)
                            .foregroundStyle(.white)
                            .padding()
                    }
                }
            }
        }
        .frame(width: cardWidth, height: cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    MovieCardView(
        scale: 2,
        movie: Movie(
            adult: false,
            backdropPath: "",
            genreIds: [],
            id: 278,
            overview: "",
            popularity: 166.018,
            posterPath: "",
            releaseDate: "",
            runtime: 142,
            title: "The Shawshank Redemption",
            video: false,
            voteAverage: 8.705,
            voteCount: 26685
        )
    )
}
