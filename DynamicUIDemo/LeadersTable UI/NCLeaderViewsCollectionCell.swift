//
//  NCLeaderViewsCollectionCell.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 12/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class NCLeaderViewsCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var leadersView: UIView!
    @IBOutlet weak var playerPointLabel: UILabel!
    @IBOutlet weak var leaderViewWidthConstr: NSLayoutConstraint!
    
    @IBOutlet weak var leaderViewHeightConstr: NSLayoutConstraint!
    @IBOutlet weak var viewNameLabel: UILabel!
    var leaderCaousel: NCLeaderCarouselView!
    var pieChartView: NCPieChartView!
    var playerNameLabel: UILabel!
    var cellData: PlayerRankViewModel?
    var leftButton: UIButton!
    var rightButton: UIButton!
    var arcWidth: CGFloat = 15
    var selectedCarouselIndx: Int = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.white
        self.playerNameLabel = UILabel()
        self.playerNameLabel.text = "        "
        self.playerNameLabel.textAlignment = .center
        self.playerNameLabel.backgroundColor = UIColor.clear
        self.playerNameLabel.font = UIFont.systemFont(ofSize: 11)
        leftButton = UIButton()
        leftButton.setImage(UIImage(named: "leftArr"), for: .normal)
        rightButton = UIButton()
        rightButton.setImage(UIImage(named: "rightArr"), for: .normal)
        viewNameLabel.textColor = UIColor.lightGray
        playerPointLabel.font = UIFont.boldSystemFont(ofSize: 13)
        
        leftButton.addTarget(self, action: #selector(NCLeaderViewsCollectionCell.leftClicked(_:)), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(NCLeaderViewsCollectionCell.rightClicked(_:)), for: .touchUpInside)
    }
    
    @objc func leftClicked(_ sender: UIButton){
        var indx = 0
        var futureIndex = 0
        var isAnimated: Bool = true
        if self.selectedCarouselIndx == 1{
            indx = self.selectedCarouselIndx - 1
            isAnimated = false
            futureIndex = self.leaderCaousel.dictionary.count - 2
            self.selectedCarouselIndx = futureIndex
        }else{
            indx = self.selectedCarouselIndx - 1
            self.selectedCarouselIndx = indx
        }
        self.leaderCaousel.leaderCollectionView.scrollToItem(at: IndexPath(item: indx, section: 0), at: .left, animated: true)
        if !isAnimated{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.leaderCaousel.leaderCollectionView.scrollToItem(at: IndexPath(item: futureIndex, section: 0), at: .centeredHorizontally, animated: false)
            }
        }
    }
    
    @objc func rightClicked(_ sender: UIButton){
        var indx = 0
        var futureIndex = 0
        var isAnimated: Bool = true
        if self.selectedCarouselIndx == self.leaderCaousel.dictionary.count - 2{
            indx = self.selectedCarouselIndx + 1
            isAnimated = false
            futureIndex = 1
            self.selectedCarouselIndx = futureIndex
        }else{
            indx = self.selectedCarouselIndx + 1
            self.selectedCarouselIndx = indx
        }
        self.leaderCaousel.leaderCollectionView.scrollToItem(at: IndexPath(item: indx, section: 0), at: .left, animated: true)
        if !isAnimated{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.leaderCaousel.leaderCollectionView.scrollToItem(at: IndexPath(item: futureIndex, section: 0), at: .centeredHorizontally, animated: false)
            }
        }
    }
    
    func updateData(data: PlayerRankViewModel){
        self.viewNameLabel.text = data.rankTitle
        self.cellData = data
        var pieChartItemsArray = [NCPieChartItem]()
        for (index, obj) in data.chartValue.enumerated(){
            let chartItem = NCPieChartItem(ratio: uint(obj), color: index == 0 ? UIColor.red : index == 1 ? UIColor.gray : UIColor.orange)
            pieChartItemsArray.append(chartItem)
        }
        pieChartView = NCPieChartView(items: pieChartItemsArray)
        pieChartView.isTitleViewHidden = true
        pieChartView.arcWidth = self.arcWidth
        if pieChartView.superview == nil{
            self.leadersView.addSubview(pieChartView)
        }
        leaderViewHeightConstr.constant = self.bounds.width - 10
        leaderViewWidthConstr.constant = self.bounds.width - 10
        self.layoutSubviews()
        self.layoutIfNeeded()
        pieChartView.frame = self.leadersView.bounds
        let padding: CGFloat = 67 + self.arcWidth
        leaderCaousel = NCLeaderCarouselView(frame: CGRect(origin: CGPoint(x: leaderViewHeightConstr.constant - padding - (pieChartView.center.x), y: leaderViewHeightConstr.constant - padding - (pieChartView.center.y)), size: CGSize(width: leaderViewHeightConstr.constant - padding, height: leaderViewHeightConstr.constant - padding)))
        leaderCaousel.center = pieChartView.center
        self.leadersView.addSubview(leaderCaousel)
        leaderCaousel.delegate = self
        layoutSubviews()
        leaderCaousel.dictionary = data.playerDetail
        leaderCaousel.createCarousel()
        leadersView.backgroundColor = UIColor.clear
        self.sendSubview(toBack: pieChartView)
        self.leadersView.addSubview(playerNameLabel)
        self.setDataOnScroll(teamStatsPD: data.playerDetail[0])
        self.leadersView.addSubview(leftButton)
        self.leadersView.addSubview(rightButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if pieChartView != nil{
            pieChartView.frame = self.leadersView.bounds
        }
        self.playerNameLabel.sizeToFit()
        if self.leaderCaousel != nil{
            self.playerNameLabel.frame = CGRect(x: (self.leaderCaousel.frame.origin.x - 10) , y: self.leaderCaousel.frame.maxY - 4 , width:  self.leaderCaousel.frame.width + 20, height: 30)
            self.leftButton.frame = CGRect(x: (self.leaderCaousel.frame.origin.x - 30), y: (self.leadersView.frame.height - 20) / 2, width: 25, height: 25)
            self.rightButton.frame = CGRect(x: (self.leaderCaousel.frame.width + 45), y: (self.leadersView.frame.height - 20) / 2, width: 25, height: 25)
        }
    }
    
    override func updateConstraintsIfNeeded() {
        super.updateConstraintsIfNeeded()
    }
    
    func setDataOnScroll(teamStatsPD: TeamStatPlayerDetail){
        self.playerNameLabel.text = teamStatsPD.playerName
        self.playerPointLabel.text = teamStatsPD.playerPoints
        self.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.cellData = nil
        self.leaderCaousel.leaderCollectionView.reloadData()
    }
}

extension NCLeaderViewsCollectionCell: LeaderCarouselDelegate{
    func currentIndexPath(indexPath: IndexPath, virtualIndexPath: IndexPath) {
        if let data = cellData{
           self.setDataOnScroll(teamStatsPD: data.playerDetail[indexPath.item])
           self.selectedCarouselIndx = virtualIndexPath.item
        }
    }
    
    
}
