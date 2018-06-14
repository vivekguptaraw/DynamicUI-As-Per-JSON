//
//  NCRosterTableViewCell.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 14/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class NCRosterTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jaerseyNumberLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        positionLabel.font = UIFont.systemFont(ofSize: 12)
        positionLabel.textColor = UIColor.lightGray
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(rawValue: 12))
        jaerseyNumberLabel.textColor = UIColor.lightGray
        jaerseyNumberLabel.font = UIFont.systemFont(ofSize: 12)
    }
    
    func updatePlayerData(data: NCPlayerDataModel){
        profileImageView.image = UIImage(named: "p3")
        positionLabel.text = data.position
        nameLabel.text = "\(data.first_name) \(data.last_name)"
        jaerseyNumberLabel.text = data.jersey
    }
    func updateCoachData(data: NCCoachDataModel){
        profileImageView.image = UIImage(named: "p1")
        positionLabel.text = data.position
        nameLabel.text = "\(data.first_name) \(data.last_name)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.nameLabel.text = nil
        self.positionLabel.text = nil
        self.jaerseyNumberLabel.text = nil
    }
    
}
