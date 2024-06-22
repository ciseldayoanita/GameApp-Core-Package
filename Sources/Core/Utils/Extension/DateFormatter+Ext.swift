//
//  DateFormatter+Ext.swift
//
//
//  Created by Ciselda Yoanita P on 22-06-2024.
//

import Foundation

public extension DateFormatter {
    static func format(
        from dateString: String,
        dateFormatFrom: String = "yyyy-MM-dd",
        dateFormatTo: String = "dd-MM-yyyy"
    ) -> String? {
        let dateFormatter = DateFormatter(dateFormat: dateFormatFrom)
        let date = dateFormatter.date(from: dateString)
                
        if let date = date {
            dateFormatter.dateFormat = dateFormatTo
            let dateFormattedString = dateFormatter.string(from: date)
            return dateFormattedString
        } else {
            return nil
        }
    }
}

public extension DateFormatter {
    convenience init(dateFormat: String) {
        self.init()
        self.dateFormat = dateFormat
    }
}
