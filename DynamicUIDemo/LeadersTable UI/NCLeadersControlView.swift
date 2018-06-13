//
//  NCLeadersControlView.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 12/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class NCLeadersControlView: UIView {
    
    var mainCollectionView: UICollectionView!
    var array: [PlayerRankViewModel] = []
    let leaderCellIdentifier =  "NCLeaderViewsCollectionCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func createAndLoadData(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (self.frame.width / 2.2), height: (self.frame.width / 2.2) + 60)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 30
        layout.sectionInset = UIEdgeInsets(top: 20, left: 12, bottom: 0, right: 12)
        mainCollectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        self.addSubview(mainCollectionView)
        mainCollectionView.register(UINib(nibName: leaderCellIdentifier, bundle: nil), forCellWithReuseIdentifier: leaderCellIdentifier)
        mainCollectionView.dataSource = self
        mainCollectionView.reloadData()
        mainCollectionView.backgroundColor = UIColor.white
        mainCollectionView.showsVerticalScrollIndicator = false
        mainCollectionView.alwaysBounceVertical = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NCLeadersControlView: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: leaderCellIdentifier, for: indexPath) as! NCLeaderViewsCollectionCell
        cell.updateData(data: array[indexPath.item])
        return cell
    }
    
    
}
