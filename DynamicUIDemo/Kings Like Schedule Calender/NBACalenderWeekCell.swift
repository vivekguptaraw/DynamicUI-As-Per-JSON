//
//  NBACalenderWeekCell.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 29/05/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

protocol NBACalendarDateCellDelegate: NSObjectProtocol {
    func canSelectDate(_ date: Date) -> [Any]
    func didSelectDate(_ date: Date, indexPath: IndexPath) -> [Any]
}

class NBACalenderWeekCell: UITableViewCell {
    
    @IBOutlet weak var weekCollectionView: UICollectionView!
    
    @IBOutlet weak var bubbleView: BubbleArrowView!
    
    @IBOutlet weak var selectedModelsCollectionView: UICollectionView!
    
    
    weak var delegate: NBACalendarDateCellDelegate?
    var selectedIndexPath: IndexPath?
    var indexPath: IndexPath?
    var weekNumber = 0
    var monthName: String = ""
    let dateCellIdentifier = "NBACalenderDateCell"
    let scheduleCellIdentifier = "NBAScheduleCell"
    
    var weekDate: Date? {
        didSet {
            self.weekCollectionView.delegate    = self
            self.weekCollectionView.dataSource  = self
            self.weekCollectionView.reloadData()
        }
    }
    
    var cellModel: [Any] = [Any]() {
        didSet {
            self.selectedModelsCollectionView.delegate    = self
            self.selectedModelsCollectionView.dataSource  = self
            self.selectedModelsCollectionView.reloadData()
        }
    }
    
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
////        let weekCollectionheight: CGFloat = self.frame.height
////        let selectedModelsCollectionheight: CGFloat = self.frame.height - weekCollectionheight
////        let weekLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
////        let slectedModelsLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
////        self.weekCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: weekCollectionheight), collectionViewLayout: weekLayout)
////        self.selectedModelsCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: selectedModelsCollectionheight), collectionViewLayout: slectedModelsLayout )
//        self.weekCollectionView.register(NBACalenderDateCell.self, forCellWithReuseIdentifier: dateCellIdentifier)
//        self.selectedModelsCollectionView.register(NBAGameScheduleCollCell.self, forCellWithReuseIdentifier: scheduleCellIdentifier)
//        self.addSubview(self.weekCollectionView)
//        //Programmatically adding
//        let leftConstraint = NSLayoutConstraint(item: self.weekCollectionView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leadingMargin, multiplier: 1.0, constant: 0)
//        
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.weekCollectionView.register(NBACalenderDateCell.self)
        self.selectedModelsCollectionView.register(NBAGameScheduleCollCell.self)
        self.layer.masksToBounds    = true
        self.bubbleView.isHidden    = true
        self.backgroundColor        = UIColor.lightGray
        self.contentView.backgroundColor        = UIColor.lightGray
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let flowLayout = self.selectedModelsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.itemSize = self.selectedModelsCollectionView.frame.size
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.weekCollectionView.delegate    = nil
        self.weekCollectionView.dataSource  = nil
        self.selectedModelsCollectionView.delegate        = nil
        self.selectedModelsCollectionView.dataSource      = nil
        self.weekDate = nil
        self.bubbleView.isHidden    = true
    }
}

extension NBACalenderWeekCell: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.isEqual(self.selectedModelsCollectionView) {
            return self.cellModel.count
        }
        return 7
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.isEqual(self.selectedModelsCollectionView) {
            self.bubbleView.isHidden        = true
            if let selected = selectedIndexPath {
                let width = (self.frame.width / 7)
                self.bubbleView.isHidden    = false
                self.bubbleView.arrowPosition = width * CGFloat(selected.row) + (width / 2 - 10)
            }
            
                let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as NBAGameScheduleCollCell
                cell.gsBubbleArrowView.isHidden    = true
            
                if self.cellModel.count > indexPath.row {
//                    if let gameModel = self.cellModel[indexPath.row] as? GameDetails {
//                        cell.gameViewModel = GameDetailsViewModel(game: gameModel)
//                        cell.dateScoreContraint.constant = cell.gameViewModel!.shoulShowBuyTicket ? 5: 30
//                        cell.radioAndGetTixButton.setTitleColor(ThemeManager.currentTheme.kingsDarkGray, for: UIControlState.normal)
//                        cell.radioAndGetTixButton.setTitleColor(ThemeManager.currentTheme.kingsPurple, for: UIControlState.selected)
//
                        self.bubbleView.fillColor = UIColor.red
                    //}
                }
                return cell
            
        }
        
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as NBACalenderDateCell
        cell.cellDate = nil
        
        var component = DateComponents()
        component.day = indexPath.item
        if let date = Calendar.current.date(byAdding: component, to: self.weekDate!) {
            if Int(monthName) == Calendar.autoupdatingCurrent.component(Calendar.Component.month, from: date) {
                if let dlg = self.delegate {
                    cell.dateSelectmodel = dlg.canSelectDate(date).first
                }
                cell.cellDate = date
            }
        }
        
        return cell
        
    }
}

extension NBACalenderWeekCell: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if collectionView.isEqual(self.selectedModelsCollectionView) {
            return true
        }else {
            if let date = self.weekDate?.addingTimeInterval(TimeInterval(86400 * indexPath.item)) {
                if Int(monthName) == Calendar.autoupdatingCurrent.component(Calendar.Component.month, from: date) {
                    if let dlg = self.delegate {
                        return dlg.canSelectDate(date).count > 0
                    }
                }
            }
        }
        return false
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        self.bubbleView.isHidden    = true
        if collectionView.isEqual(self.selectedModelsCollectionView) {
            if let cell = collectionView.cellForItem(at: indexPath) as? NBAGameScheduleCollCell{
                //get gamedetailmodel here from gameschedulecell and deeplink for gamedetail
            }
        }else {
            self.selectedIndexPath = indexPath
            if let date = self.weekDate?.addingTimeInterval(TimeInterval(86400 * indexPath.item)) {
                if Int(monthName) == Calendar.autoupdatingCurrent.component(Calendar.Component.month, from: date) {
                    if let dlg = self.delegate {
                        if let indexP = self.indexPath {
                            self.cellModel =  dlg.didSelectDate(date, indexPath: indexP)
                        }
                    }
                }
            }
        }
    }
}
