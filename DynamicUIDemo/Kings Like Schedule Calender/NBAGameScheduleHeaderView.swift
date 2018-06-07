//
//  NBAGameScheduleHeaderView.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 05/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class NBAGameScheduleHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var monthLabel: UILabel!
    
    @IBOutlet weak var weekDay1Label: UILabel!
    
    @IBOutlet weak var weekDay2Label: UILabel!
    
    @IBOutlet weak var weekDay3Label: UILabel!
    
    @IBOutlet weak var weekDay4Label: UILabel!
    
    @IBOutlet weak var weekDay5Label: UILabel!
    
    @IBOutlet weak var weekDay6Label: UILabel!
    
    @IBOutlet weak var weekDay7Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.weekDay1Label.text  = "SUN"
        self.weekDay2Label.text  = "MON"
        self.weekDay3Label.text  = "TUE"
        self.weekDay4Label.text  = "WED"
        self.weekDay5Label.text  = "THU"
        self.weekDay6Label.text  = "FRI"
        self.weekDay7Label.text  = "SAT"
        self.contentView.backgroundColor = UIColor.hexStringToUIColor(hex: "ffffff")
    }

}
