//
//  LeftTableViewCell.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 09/05/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class LeftTableViewCell: UITableViewCell {

    @IBOutlet weak var labelText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
