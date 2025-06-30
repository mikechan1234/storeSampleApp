//
//  FilmFormatter.swift
//  Cinemas
//
//  Created by Michael Chan on 28/04/2025.
//

import Observation
import Foundation
import SwiftUICore

@Observable
class FilmFormatter {
    private let durationFormatter: NumberFormatter = NumberFormatter()
    private let ratingFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        formatter.minimumFractionDigits = 1
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    func formatDuration(_ duration: Int) -> String {
        let minutes = duration / 60
        let seconds = duration % 60
        let stringSeconds = String(format: "%02d", seconds)
        return "\(minutes):\(stringSeconds)"
    }
    
    func formatRating(_ rating: Double) -> String {
        ratingFormatter.string(from: NSNumber(value: rating)) ?? ""
    }
}

extension EnvironmentValues {
    @Entry var filmFormatter: FilmFormatter = FilmFormatter()
}
