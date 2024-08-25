//
//  ContentView.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 25/08/2024.
//

import SwiftUI

struct ContentView: View {

    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.background)
    }

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("home")
                }
                .background(Color.background)

            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("search")
                }
                .background(Color.background)

            WatchListView()
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("watch_list")
                }
                .background(Color.background)
        }
        .task {
            await GenreManager.shared.fetchGenres()
        }
    }
}

#Preview {
    ContentView()
}
