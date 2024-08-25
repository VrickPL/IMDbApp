//
//  SearchBarView.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 25/08/2024.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String

    var body: some View {
        TextField("search", text: $searchText)
            .overlay(
                ZStack {
                    if searchText.isEmpty {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(
                                Color.searchBarForeground)
                    } else {
                        Image("x.circle")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .onTapGesture {
                                searchText = ""
                            }
                    }
                },
                alignment: .trailing
            )
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.searchBarBackground)
            )
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
