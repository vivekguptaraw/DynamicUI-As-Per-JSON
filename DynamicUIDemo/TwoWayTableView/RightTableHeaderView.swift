//
//  RightTableHeaderView.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 14/05/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class RightTableHeaderView: UIView {
    //
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var contentView: UIView!
    var array: [String] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("RightTableHeaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.frame
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.collectionView.register(RightCollectionViewCell.self)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal //.horizontal
        layout.itemSize = CGSize(width: rightCollectionViewCellSize, height: 50)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.dataSource = self
    }
}
extension RightTableHeaderView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as RightCollectionViewCell
        cell.labelText.text = array[indexPath.row]
        cell.labelText.textColor = UIColor.green
        return cell
    }
}
