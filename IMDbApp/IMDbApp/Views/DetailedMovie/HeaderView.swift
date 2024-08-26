//
//  HeaderView.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 26/08/2024.
//
import SwiftUI

struct HeaderView: View {
        var movie: Movie?

        var body: some View {
            ZStack {
                ZStack {
                    AsyncImage(
                        url: URL(
                            string: movie?.backdropImageUrlString ?? "")
                    ) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ZStack {
                            Color.loadingMovie

                            VStack {
                                CustomProgressView()
                            }
                        }
                    }

                    VStack {
                        Spacer()

                        HStack {
                            Spacer()

                            HStack(spacing: 4) {
                                Image(systemName: "star")
                                Text(
                                    Utils.roundToOneDecimalPlace(
                                        from: movie?.voteAverage ?? 0)
                                )
                                .bold()
                            }
                            .font(.footnote)
                            .foregroundStyle(.orange)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 7)
                            .background(Color.background.opacity(0.8))
                            .cornerRadius(8)
                        }
                    }
                    .padding(10)
                }
                .frame(width: screenWidth, height: backdropImageHeight)
                .offset(y: 0)

                HStack {
                    MovieCardView(scale: 0.7, movie: movie!, showTitle: false)

                    VStack {
                        VStack {}.frame(maxHeight: .infinity)

                        VStack {
                            Text(movie?.title ?? "")
                                .font(.title3)
                                .bold()
                                .lineLimit(2)
                                .truncationMode(.tail)
                        }
                        .frame(maxHeight: .infinity)
                    }
                    .padding(.leading, 8)
                    .frame(height: (210 * 0.7))

                    Spacer()
                }
                .padding(.horizontal, 32)
                .offset(y: posterImageOffsetY)
            }
        }

        private var screenWidth: CGFloat {
            UIScreen.main.bounds.width
        }

        private var screenHeight: CGFloat {
            UIScreen.main.bounds.height
        }

        private var backdropImageHeight: CGFloat {
            return screenHeight * 0.26
        }

        private var posterImageOffsetY: CGFloat {
            return screenHeight * 0.13
        }
    }
