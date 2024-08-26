//
//  MovieDetailsCategory.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 26/08/2024.
//

import SwiftUI

struct MovieDetailsCategoryPicker: View {
    @Binding var selectedCategory: MovieDetailsCategory

    var body: some View {
        HStack {
            ForEach(MovieDetailsCategory.allCases, id: \.self) { category in
                VStack {
                    Text(LocalizedStringKey(category.rawValue))
                        .font(.system(size: 16))
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
                .onTapGesture {
                    withAnimation {
                        selectedCategory = category
                    }
                }
            }
        }
    }
}

#Preview {
    MovieDetailsCategoryPicker(selectedCategory: .constant(.aboutMovie))
}
