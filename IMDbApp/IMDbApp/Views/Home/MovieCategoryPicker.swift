//
//  MovieCategoryPicker.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 25/08/2024.
//

import SwiftUI

struct MovieCategoryPicker: View {
    @Binding var selectedCategory: MovieCategory

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(MovieCategory.allCases, id: \.self) { category in
                    VStack {
                        Text(LocalizedStringKey(category.rawValue))
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(
                                selectedCategory == category
                                    ? Color.foreground : .gray
                            )
                            .padding(.bottom, 5)

                        if selectedCategory == category {
                            Rectangle()
                                .frame(height: 2)
                                .transition(.opacity)
                        } else {
                            Rectangle()
                                .fill(Color.clear)
                                .frame(height: 2)
                        }
                    }
                    .padding(.leading)
                    .onTapGesture {
                        withAnimation {
                            selectedCategory = category
                        }
                    }
                }
            }
            .padding(.vertical)
            .padding(.horizontal, 8)
            .padding(.trailing)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    MovieCategoryPicker(selectedCategory: .constant(.nowPlaying))
}
