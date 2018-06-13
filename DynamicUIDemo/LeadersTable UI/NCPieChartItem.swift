//
//  NCPieChartItem.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 12/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import Foundation
public class NCPieChartItem {
    
    var ratio: CGFloat
    var color: UIColor
    var startAngle: CGFloat?
    var endAngle: CGFloat?
    var title: String?
    
    public init(ratio: uint, color: UIColor, title: String? = nil) {
        self.ratio = CGFloat(ratio)
        self.color = color
        self.title = title
    }
}
