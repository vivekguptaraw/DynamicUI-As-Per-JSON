//
//  RightCollectionViewCell.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 09/05/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class RightCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var labelText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.borderColor = UIColor.clear.cgColor
        // Initialization code
    }

}
