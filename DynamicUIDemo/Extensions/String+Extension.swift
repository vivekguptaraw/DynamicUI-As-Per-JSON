//
//  String+Extension.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 07/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import Foundation
import UIKit
var CC_MD5_DIGEST_LENGTH: Int = 16;          /* digest length in bytes */
var CC_MD5_BLOCK_BYTES: Int = 64;         /* block size in bytes */
var CC_MD5_BLOCK_LONG: Int = (CC_MD5_BLOCK_BYTES / MemoryLayout<CC_LONG>.size.self)

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
    
    var md5: String! {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CC_LONG(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        
        CC_MD5(str!, strLen, result)
        
        let hash = NSMutableString()
        for i in 0..<digestLen {
            hash.appendFormat("%02x", result[i])
        }
        
        result.deinitialize()
        
        return String(format: hash as String)
    }
}
