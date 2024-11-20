//
//  DateFormatterUtils.swift
//  CWK2Template
//
//  Created by girish lukka on 02/11/2023.
//

import Foundation

// this class provides shared instances of dates formatted in different variations
class DateFormatterUtils {
    
// shared date formats
    static let shared: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
        return dateFormatter
    }()
//provides shared instance of the date formatted as a short instance
    static let shortDateFormat: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter
    }()

    static let timeFormat: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter
    }()

    static let customFormat: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter
    }()

    // date formatting functions
    //formatting a date returning the formatted dates using the shared date instances
    static func formattedDate(from timestamp: Int, format: String) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }

    static func formattedCurrentDate(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: Date())
    }

    static func formattedDateWithStyle(from timestamp: Int, style: DateFormatter.Style) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: date)
    }
    static func formattedDate12Hour(from timestamp: TimeInterval) -> String {
            let date = Date(timeIntervalSince1970: timestamp)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm a"
            return dateFormatter.string(from: date)
        }
    static func formattedDateWithDay(from timestamp: TimeInterval) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh a, EEE" // Format for 12-hour time with AM/PM and abbreviated day of the week
            dateFormatter.amSymbol = "AM"
            dateFormatter.pmSymbol = "PM"
            let dateString = dateFormatter.string(from: Date(timeIntervalSince1970: timestamp))
            return dateString
        }
    static func formattedDateWithWeekdayAndDay(from timestamp: TimeInterval) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE dd"
            return dateFormatter.string(from: Date(timeIntervalSince1970: timestamp))
        }
    static func formattedDateTime(from timestamp: TimeInterval) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d,  yyyy 'at' ha"
            return dateFormatter.string(from: Date(timeIntervalSince1970: timestamp))
        }
        
}
