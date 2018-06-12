//
//  NCScheduleListCell.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 07/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class NCScheduleListCell: UICollectionViewCell {
    @IBOutlet weak var visitorScoreLabel: UILabel!
    @IBOutlet weak var homeScoreLabel: UILabel!
    @IBOutlet weak var visitorTeamName: UILabel!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var visitorTeamImage: UIImageView!
    @IBOutlet weak var homeTeamImage: UIImageView!
    
    @IBOutlet weak var finalLabel: UILabel!
    @IBOutlet weak var daysConstantLabel: UILabel!
    @IBOutlet weak var hrsConstantLabel: UILabel!
    @IBOutlet weak var minConstantLabel: UILabel!
    
    @IBOutlet weak var dayCountLabel: UILabel!
    @IBOutlet weak var hrsCountLabel: UILabel!
    @IBOutlet weak var minCountLabel: UILabel!
    
    @IBOutlet weak var dhmTimerView: UIView!
    
    @IBOutlet weak var buyTicketButton: UIButton!
    
    @IBOutlet var channelNameToBuyTicketConstraint: NSLayoutConstraint!
    
    @IBOutlet var channelNameToBottomLayoutConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var channelNameLabel: UILabel!
    
    @IBOutlet weak var homeAwayLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()    
    }
    
    func updateConstraintsAsPerButton(indexPath: IndexPath,  isLast: Bool){
        
        if isLast{
            buyTicketButton.isHidden = false
            channelNameToBuyTicketConstraint.isActive = true
            channelNameToBottomLayoutConstraint.isActive = false
            dhmTimerView.isHidden = false
            dateLabel.isHidden = true
            finalLabel.isHidden = true
            visitorScoreLabel.text = "SAC"
            homeScoreLabel.text = "MIA"
            visitorTeamName.isHidden = true
            homeTeamName.isHidden = true
            
        }else{
            buyTicketButton.isHidden = true
            channelNameToBuyTicketConstraint.isActive = false
            channelNameToBottomLayoutConstraint.isActive = true
            dhmTimerView.isHidden = true
            dateLabel.isHidden = false
            finalLabel.isHidden = false
            visitorScoreLabel.text = "85"
            homeScoreLabel.text = "62"
            visitorTeamName.isHidden = false
            homeTeamName.isHidden = false
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    @IBAction func buyTicketClicked(_ sender: UIButton) {
    }
    
}
