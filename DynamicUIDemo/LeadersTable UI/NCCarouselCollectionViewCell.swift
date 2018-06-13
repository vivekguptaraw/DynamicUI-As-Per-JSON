//
//  NCCarouselCollectionViewCell.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 12/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class NCCarouselCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        playerName.text = " nn "
    }
    
    func updateData(model: TeamStatPlayerDetail){
        playerName.text = model.playerName
        imageView.image = UIImage(named: model.playerImageUrl)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    
    }
}
