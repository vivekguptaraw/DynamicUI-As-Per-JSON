//
//  ShotChartCustomView.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 21/05/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit


enum TeamSelected: String {
    case Home = "home"
    case Opponent = "opponent"
}

 protocol ShotChartMainViewProtocol: class {
    
     func quarterSelected<T>(quarter: T)
}

class ShotChartCustomView: UIView {
    weak var delegate: ShotChartMainViewProtocol?
    lazy var shotTrackerView: NBAShotTrackerHeaderView = {
        let shotChart: NBAShotTrackerHeaderView = Bundle.main.loadNibNamed("NBAShotTrackerHeaderView", owner: self, options: nil)?.first as! NBAShotTrackerHeaderView
        shotChart.numberOfQtrSelected = self.selectedQuaters.count
        shotChart.collectionView.register(QuarterViewCell.self)
        shotChart.collectionView.delegate    = self
        shotChart.collectionView.dataSource  = self
        self.addSubview(shotChart)
        self.addSubview(segmentController)
        return shotChart
    }()
    var selectedQuaters: [Int] = [1, 2, 3, 4]
    var segmentController: UISegmentedControl = UISegmentedControl(items: ["Team 1", "Team 2"])
    var keyColor: UIColor = UIColor.black{
        didSet{
            
        }
    }
    var homeTeamColor: UIColor = UIColor.hexStringToUIColor(hex: "314989")
    var visitorTeamColor: UIColor = UIColor.hexStringToUIColor(hex: "4db7bc")
    var period: Int = 4{
        didSet{
            selectedQuaters.removeAll()
            for i in 0..<period {
                selectedQuaters.append(i + 1)
            }
        }
    }
    
    var teamNamesArray:[String] = []{
        didSet{
            self.segmentController.addTarget(self, action: #selector(ShotChartCustomView.segmentSelectionChange(seg:)), for: UIControlEvents.valueChanged)
            for (index, item) in teamNamesArray.enumerated()  {
                self.segmentController.setTitle(item.uppercased(), forSegmentAt: index)
            }
        }
    }
    
    var teamSelected: TeamSelected  = TeamSelected.Home {
        didSet {
            self.fetchPlayByPlay()
        }
    }
    
    var playByPlayHome: [PlayByPlay] = []{
        didSet{
        }
    }
    var playByPlayVisitor: [PlayByPlay] = []{
        didSet{
        }
    }
    
    func setPlayByPlay(visitor: [[String: Any]], home: [[String: Any]]){
        for obj in visitor{
            let playByPlay = PlayByPlay(json: obj)
            self.playByPlayVisitor.append(playByPlay)
        }
        for obj in home{
            let playByPlay = PlayByPlay(json: obj)
            self.playByPlayHome.append(playByPlay)
        }
    }

    func createQuarterCollectionView(){
        let count =  CGFloat(selectedQuaters.count)
        (self.shotTrackerView.collectionView.collectionViewLayout as! (UICollectionViewFlowLayout)).itemSize = CGSize(width: (UIScreen.main.bounds.width - count) / count, height: self.shotTrackerView.collectionView.bounds.height - 2)
        if self.teamSelected == .Home {
            self.segmentController.selectedSegmentIndex = 1
        }
    }
    
    func fetchPlayByPlay(){
        if teamSelected == .Opponent{
            self.keyColor = self.visitorTeamColor
            self.shotTrackerView.teamColor = keyColor
            self.shotTrackerView.playByPlay = self.filterPlayByPlayAsPerQuarter(playByPlay: self.playByPlayVisitor)
            self.segmentController.selectedSegmentIndex = 0
        }else{
            self.keyColor = self.homeTeamColor
            self.shotTrackerView.teamColor = keyColor
            self.shotTrackerView.playByPlay = self.filterPlayByPlayAsPerQuarter(playByPlay: self.playByPlayHome)
            self.segmentController.selectedSegmentIndex = 1
        }
    }
    
    func filterPlayByPlayAsPerQuarter(playByPlay: [PlayByPlay]) -> [PlayByPlay] {
        let arr = playByPlay.filter{
            return self.selectedQuaters.contains($0.current_session!)
        }
        return arr
    }
    
    
    @objc private func segmentSelectionChange(seg: UISegmentedControl){
        if seg.selectedSegmentIndex == 0{
            self.teamSelected = .Opponent
            self.keyColor = self.visitorTeamColor
        }else{
            self.teamSelected = .Home
            self.keyColor = self.homeTeamColor
        }
        self.shotTrackerView.baseView.isHidden                  = true
        self.shotTrackerView.selectedCircleLabel.isHidden       = true
        self.shotTrackerView.playByPlayLabel.isHidden           = true
        self.shotTrackerView.roundCircleImage.isHidden          = true
        self.shotTrackerView.flotingLabel.isHidden              = true
        self.shotTrackerView.multiSelectionbaseView.isHidden    = true
        self.fetchPlayByPlay()
        self.shotTrackerView.collectionView.reloadData()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.createQuarterCollectionView()
        self.segmentController.frame = CGRect(x: 30, y: 0, width: self.frame.width - 60, height: 40)
        self.shotTrackerView.frame = CGRect(x: 0, y: self.segmentController.frame.maxY + yMarginForShotTrakerView, width: self.frame.width, height: UIScreen.main.bounds.width / 1.5475578406 + 103)
        self.backgroundColor = UIColor.hexStringToUIColor(hex: "DCDCDC")
    }

}

extension ShotChartCustomView: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.period < 4 ? 4: period
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: QuarterViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as QuarterViewCell
        
        if self.selectedQuaters.contains(indexPath.row + 1) {
            cell.backgroundColor   = keyColor
            cell.quarterLabel.font = UIFont.systemFont(ofSize: 16)
            cell.quarterLabel.textColor = UIColor.white
        }else {
            cell.backgroundColor   = UIColor.white
            cell.quarterLabel.font = UIFont.systemFont(ofSize: 16)
            cell.quarterLabel.textColor = keyColor
        }
        
        cell.quarterLabel.text                  = indexPath.row.getPeriodNameForPeriod()
        
        cell.quarterLabel.accessibilityValue    = cell.quarterLabel.text
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell: QuarterViewCell = collectionView.cellForItem(at: indexPath) as! QuarterViewCell
        
        if self.selectedQuaters.contains(indexPath.row + 1) {
            if self.selectedQuaters.count > 1 {
                if let index = self.selectedQuaters.index(of: indexPath.row + 1) {
                    self.selectedQuaters.remove(at: index)
                }
                cell.backgroundColor   = UIColor.white
                cell.quarterLabel.textColor = self.keyColor
                cell.quarterLabel.font = UIFont.boldSystemFont(ofSize: 20)
                self.shotTrackerView.numberOfQtrSelected = self.selectedQuaters.count
                self.fetchPlayByPlay()
            }
        }else {
            self.selectedQuaters.append(indexPath.row + 1)
            cell.backgroundColor   = keyColor
            cell.quarterLabel.textColor = UIColor.white
            cell.quarterLabel.font = UIFont.systemFont(ofSize: 20)
            self.shotTrackerView.numberOfQtrSelected = self.selectedQuaters.count
            self.fetchPlayByPlay()
        }
        self.delegate?.quarterSelected(quarter: self.selectedQuaters)
    }
}


extension Int {
    func getPeriodNameForPeriod () -> String{
        switch (self) {
        case 0...3:
            return "Q\(self + 1)"
        default:
            return "OT\(self - 3)"
        }
    }
}

