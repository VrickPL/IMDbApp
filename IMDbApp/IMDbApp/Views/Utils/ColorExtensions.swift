//
//  ColorExtensions.swift
//  IMDbApp
//
//  Created by Jan Kazubski on 26/08/2024.
//

import Foundation
import SwiftUI


func colorForRating(_ rating: Int) -> Color {
    return switch rating {
    case 0:
         Color(hex: "#FF0000")  // red
    case 1:
         Color(hex: "#FF6666")  // lightRed
    case 2:
         Color(hex: "#FF8C00")  // darkOrange
    case 3:
         Color(hex: "#FFA500")  // orange
    case 4:
         Color(hex: "#FFD700")  // lightOrange
    case 5:
         Color(hex: "#FFFF00")  // yellow
    case 6:
         Color(hex: "#FFFF99")  // darkYellow
    case 7:
         Color(hex: "#99FF99")  // lightGreen
    case 8:
         Color(hex: "#00FF00")  // green
    case 9:
         Color(hex: "#4682B4")  // steelblue
    case 10:
         Color(hex: "#87CEFA")  // Blue
    default:
        Color.foreground
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
