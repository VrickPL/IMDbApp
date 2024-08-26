//
//  Review.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 26/08/2024.
//

import Foundation

// MARK: - ReviewResponse
struct ReviewResponse: Codable {
    let reviews: [Review]

    enum CodingKeys: String, CodingKey {
        case reviews = "results"
    }
}

// MARK: - Review
struct Review: Codable, Identifiable {
    let author: String
    let authorDetails: AuthorDetails?
    let content, createdAt, id: String

    enum CodingKeys: String, CodingKey {
        case author
        case authorDetails = "author_details"
        case content
        case createdAt = "created_at"
        case id
    }
}

// MARK: - AuthorDetails
struct AuthorDetails: Codable {
    let name, username: String
    let avatarPath: String?
    let rating: Int?
}

extension Review {
    var authorName: String {
        authorDetails?.authorName ?? author
    }

    var authorImage: String {
        var imagePath = authorDetails?.avatarPath ?? ""
        if !imagePath.starts(with: "/") {
            imagePath = "/" + imagePath
        }
        return Endpoint.imageBaseUrl + imagePath
    }

    var authorRating: String {
        return if let rating = authorDetails?.rating {
            "\(rating)"
        } else {
            ""
        }
    }

    var formattedCreatedAt: String {
        let isoFormatter = DateFormatter()
        isoFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        // Konwersja String na Date
        if let date = isoFormatter.date(from: createdAt) {
            // Ustawienie formatera do wyjściowego formatu DD-MM-YYYY
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "dd-MM-yyyy"

            // Konwersja Date na String
            return outputFormatter.string(from: date)
        }
        return ""
    }
}

extension AuthorDetails {
    var authorName: String {
        name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            ? username : name
    }
}
