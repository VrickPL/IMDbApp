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
}
