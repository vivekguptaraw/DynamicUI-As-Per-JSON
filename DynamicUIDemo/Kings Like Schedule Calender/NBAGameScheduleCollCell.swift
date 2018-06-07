//
//  NBAGameScheduleCollCell.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 05/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class NBAGameScheduleCollCell: UICollectionViewCell {
    
    @IBOutlet weak var gsPointsViewBase: UIView!
    @IBOutlet weak var gsHomeTeamImage: UIImageView!
    @IBOutlet weak var gsHomeTeamScoreNameLabel: UILabel!
    @IBOutlet weak var gsHomeTeamWinLabel: UILabel!
    
    @IBOutlet weak var gsOpponentTeamImage: UIImageView!
    @IBOutlet weak var gsOpponentTeamScoreNameLabel: UILabel!
    @IBOutlet weak var gsOpponentTeamWinLabel: UILabel!
    
    @IBOutlet weak var gsStadiumLabel: UILabel!
    @IBOutlet weak var gsDateTimeLabel: UILabel!
    @IBOutlet weak var gsQuarterTimeLabel: UILabel!
    
    @IBOutlet weak var gsRadioButton: UIButton!
    @IBOutlet weak var gsBubbleArrowView: BubbleArrowView!
    @IBOutlet weak var gsBuyTicketButton: UIButton!
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
