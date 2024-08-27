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

    private var cardWidth: CGFloat {
        144.61 * scale
    }
    private var cardHeight: CGFloat {
        210 * scale
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
