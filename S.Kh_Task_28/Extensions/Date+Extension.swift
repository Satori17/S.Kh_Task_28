//
//  Date+Extension.swift
//  S.Kh_Task_28
//
//  Created by Saba Khitaridze on 31.08.22.
//

import UIKit

extension Date {
    func dayOfTheWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
