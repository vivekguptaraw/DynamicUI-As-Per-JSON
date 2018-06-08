//
//  Int+Extension.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 07/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import Foundation

extension Int {
    func getPeriodNameForPeriod () -> String{
        switch (self) {
        case 0...3:
            return "Q\(self + 1)"
        default:
            return "OT\(self - 3)"
        }
    }
}
