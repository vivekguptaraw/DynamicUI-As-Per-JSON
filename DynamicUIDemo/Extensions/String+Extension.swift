//
//  String+Extension.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 07/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import Foundation

extension String{
    func getFirstDate(weekNumber: Int) -> Date {
        let calendar = Calendar.autoupdatingCurrent
        let mothYearArray       = self.components(separatedBy: "-")
        
        var component           = DateComponents()
        component.year          = Int(mothYearArray[0])
        component.month         = Int(mothYearArray[1])
        component.weekOfMonth   = weekNumber
        component.weekday       = calendar.firstWeekday
        return calendar.date(from: component)!
    }
    func getMonthYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "MMMM YYYY"
        return dateFormatter.string(from: date!)
    }
}
