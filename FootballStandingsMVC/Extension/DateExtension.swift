//
//  DateExtension.swift
//  FootballStandingsMVC
//
//  Created by Никита Горбунов on 14.07.2022.
//

import Foundation

extension DateFormatter {
    public static func getDateString(date: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mmZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: date)
    }
    
    public static func getStringDate(date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        return dateFormatter.string(from: date)
    }
}
