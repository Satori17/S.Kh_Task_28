//
//  DateTransformer.swift
//  S.Kh_Task_28
//
//  Created by Saba Khitaridze on 31.08.22.
//

import UIKit

final class DateTransformer {
    
    static func transformDate(currentDate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from:currentDate)
        guard let date = date else { return Date() }
        
        return date
    }
}
