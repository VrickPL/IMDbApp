//
//  MovieCategory.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 25/08/2024.
//

import Foundation

enum MovieCategory: String, CaseIterable {
    case nowPlaying = "now_playing"
    case upcoming = "upcoming"
    case topRated = "top_rated"
    case popular = "popular"
}
