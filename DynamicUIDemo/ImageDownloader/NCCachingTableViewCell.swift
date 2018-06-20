//
//  NCCachingTableViewCell.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 19/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class NCCachingTableViewCell: UITableViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateData(localUrl: String, shouldReload: Bool){
        cellImageView.loadOrUpadateImage(with: localUrl, shouldReload: false, completion: { (image) in
            DispatchQueue.main.async {
                self.layoutSubviews()
            }
        }) { (urlString, image) in
            DispatchQueue.main.async {
                self.layoutSubviews()
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        cellImageView.image = nil
    }
    
}
