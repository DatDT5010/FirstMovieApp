//
//  Extension_Date.swift
//  FirstMovieApp
//
//  Created by Datdt on 01/11/2023.
//

import Foundation

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()

    static let dateOnly: DateFormatter = {
         let formatter = DateFormatter()
         formatter.dateFormat = "MMM d, yyyy"
         return formatter
    }()

    static func string(iso string: String) -> String {
        let date = DateFormatter.iso8601Full.date(from: string)!
        return  DateFormatter.dateOnly.string(from: date)
    }
}

