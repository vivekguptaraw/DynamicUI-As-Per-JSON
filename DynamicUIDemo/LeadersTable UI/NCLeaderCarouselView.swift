//
//  NCLeaderCarouselView.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 12/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

protocol LeaderCarouselDelegate {
    func currentIndexPath(indexPath: IndexPath,virtualIndexPath: IndexPath)
}


class NCLeaderCarouselView: UIView {
    
    var leaderCollectionView: UICollectionView!
    var dictionary: [TeamStatPlayerDetail] = []
    let reuseIdentifier = "NCCarouselCollectionViewCell"
    var delegate: LeaderCarouselDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createCarousel(){
        self.setCircularDictionary()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.frame.width, height: self.frame.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        leaderCollectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        self.addSubview(leaderCollectionView)
        leaderCollectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        leaderCollectionView.dataSource = self
        leaderCollectionView.delegate = self
        leaderCollectionView.isPagingEnabled = true
        leaderCollectionView.reloadData()
        leaderCollectionView.showsHorizontalScrollIndicator = false
        self.backgroundColor = UIColor.yellow
        if self.dictionary.count >= 2{
            self.leaderCollectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .left, animated: false)
        }
    }
    
    func setCircularDictionary(){
        if self.dictionary.count >= 2{
            var tmp = [TeamStatPlayerDetail]()
            tmp.append(dictionary.last!)
            tmp.append(contentsOf: dictionary)
            tmp.append(dictionary.first!)
            self.dictionary = tmp
        }
    }
    var lastContentOffset: CGFloat = 0
}

extension NCLeaderCarouselView : UICollectionViewDelegate{
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("did end dragging")
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        lastContentOffset = scrollView.contentOffset.x
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("EndDecel dragging")
        let contentOffsetWhenFullyScrolledRight = self.leaderCollectionView.frame.size.width * CGFloat(self.dictionary.count - 1)
        if round(scrollView.contentOffset.x) == round(contentOffsetWhenFullyScrolledRight){
            let indexPath = IndexPath(item: 1, section: 0)
            self.leaderCollectionView.scrollToItem(at: indexPath, at: .left, animated: false)
        }else if round(scrollView.contentOffset.x) == 0{
            let indexPath = IndexPath(item: self.dictionary.count - 2, section: 0)
            self.leaderCollectionView.scrollToItem(at: indexPath, at: .left, animated: false)
        }
        let centerPoint = self.leaderCollectionView.contentOffset.x / self.leaderCollectionView.bounds.size.width
        let _indexPath = IndexPath(row: Int(round(centerPoint)), section: 0)
        if scrollView.isEqual(self.leaderCollectionView){
                var itemNum = _indexPath.item
                print("indx \(itemNum)")
                if _indexPath.item == 0{
                    itemNum = self.dictionary.count - 3
                }else if _indexPath.item == self.dictionary.count - 1{
                    itemNum = 0
                }else{
                    itemNum -= 1                    
                }
            
            delegate?.currentIndexPath(indexPath: IndexPath(item: itemNum, section: 0), virtualIndexPath: _indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension NCLeaderCarouselView: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dictionary.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NCCarouselCollectionViewCell
        cell.updateData(model: dictionary[indexPath.row])
        return cell
    }
    
    
}
