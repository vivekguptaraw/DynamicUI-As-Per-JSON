//
//  RightTableViewCell.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 09/05/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class RightTableViewCell: UITableViewCell {

    @IBOutlet private weak var collectionView: UICollectionView!
    var collectionViewOffset: CGFloat {
        set {
            collectionView.contentOffset.x = newValue
            collectionView.setContentOffset(collectionView.contentOffset, animated: false)
        }
        get { return collectionView.contentOffset.x }
    }
    var indexPath = IndexPath()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.register(RightCollectionViewCell.self)        
        //MARK: Layout applied
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal //.horizontal
        layout.itemSize = CGSize(width: rightCollectionViewCellSize, height: 50)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        collectionView.setCollectionViewLayout(layout, animated: false)
        
    }
    
    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate & UIScrollViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {
//        //MARK: Scroll delegate applied
//        (collectionView as UIScrollView).delegate = dataSourceDelegate
//        collectionView.bounces = true
//        (collectionView as UIScrollView).decelerationRate = UIScrollViewDecelerationRateFast
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.setContentOffset(collectionView.contentOffset, animated:false)
        collectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

