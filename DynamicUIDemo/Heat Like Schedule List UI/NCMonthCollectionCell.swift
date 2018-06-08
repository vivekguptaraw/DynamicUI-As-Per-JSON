//
//  NCMonthCollectionCell.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 08/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class NCMonthCollectionCell: UICollectionViewCell {
    
    var monthLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(monthLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateData(month: String){
        self.monthLabel.text = month
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        monthLabel.sizeToFit()
        monthLabel.center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
    }
}
