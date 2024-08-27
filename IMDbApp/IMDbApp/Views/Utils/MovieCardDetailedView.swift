//
//  MovieCardDetailedView.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 25/08/2024.
//

import SwiftUI

struct MovieCardDetailedView: View {
    let movie: Movie
    
    private let imagesWidth: CGFloat = 20

    var body: some View {
        HStack {
            MovieCardView(scale: 0.7, movie: movie, showTitle: false)
                .padding(.trailing)

            VStack {
                HStack {
                    Text(movie.title)
                        .bold()
                        .padding(.bottom)
                        .lineLimit(1)
                        .truncationMode(.tail)
                    Spacer()
                }
                
                Spacer()

                HStack {
                    Image(systemName: "star")
                        .frame(width: imagesWidth)
                    Text(Utils.roundToOneDecimalPlace(from: movie.voteAverage))
                    Spacer()
                }
                .foregroundStyle(.orange)
                
                HStack {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                        .frame(width: imagesWidth)
                    Text(Utils.getFormattedDouble(for: movie.popularity))
                    Spacer()
                }

                HStack {
                    Image(systemName: "movieclapper")
                        .frame(width: imagesWidth)
                    Text(Utils.getFormattedGenre(for: movie))
                    Spacer()
                }

                HStack {
                    Image(systemName: "calendar")
                        .frame(width: imagesWidth)
                    Text(Utils.getYear(from: movie.releaseDate))
                    Spacer()
                }
            }
            .frame(height: 130)
        }
        .padding()
    }
}

#Preview {
    MovieCardDetailedView(
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
