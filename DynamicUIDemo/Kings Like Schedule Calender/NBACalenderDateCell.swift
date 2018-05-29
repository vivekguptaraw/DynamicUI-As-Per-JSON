//
//  NBACalenderDateCell.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 29/05/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import Foundation

class NBACalenderDateCell: UICollectionViewCell {
    var cellDate: Date? {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var dateSelectmodel: Any?
    var labelDay: UILabel = UILabel()
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if let date = self.cellDate {
            let datefomatter = DateFormatter()
            datefomatter.timeZone = TimeZone.current
            datefomatter.dateFormat = "d"
            let datestring = datefomatter.string(from: date)
            labelDay.text = datestring
        }
    }
}
