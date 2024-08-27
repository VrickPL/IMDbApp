//
//  Utils.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 25/08/2024.
//

import Foundation

struct Utils {
    static func getYear(from dateString: String?) -> String {
        guard let dateString else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: dateString) else {
            return ""
        }

        let year = Calendar.current.component(.year, from: date)
        return String(year)
    }
    
    static func roundToOneDecimalPlace(from number: Double) -> String {
        let roundedNumber = round(number * 10) / 10
        return String(format: "%.1f", roundedNumber)
    }
    
    static func getFormattedGenre(for movie: Movie?) -> String {
        let genre = GenreManager.shared.getGenre(for: movie?.genreIds.first)

        return if let genre = genre {
            genre.name
        } else {
            "N/A"
        }
    }
    
    static func getFormattedDouble(for number: Double?) -> String {
        guard let number = number else { return "N/A" }

        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 3
        formatter.numberStyle = .decimal
        
        return formatter.string(from: NSNumber(value: number)) ?? "N/A"
    }
}
