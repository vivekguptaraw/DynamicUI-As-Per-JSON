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
    var weekCollectionView: UICollectionView!
    var selectedModelsCollectionView: UICollectionView!
    weak var delegate: NBACalendarDateCellDelegate?
    var selectedIndexPath: IndexPath?
    var indexPath: IndexPath?
    var weekNumber = 0
    var monthName: String = ""
    var weekDate: Date? {
        didSet {
//            self.weekCollectionView.delegate    = self
//            self.weekCollectionView.dataSource  = self
//            self.weekCollectionView.reloadData()
        }
    }
    
    var cellModel: [Any] = [Any]() {
        didSet {
//            self.selectedModels.delegate    = self
//            self.selectedModels.dataSource  = self
//            self.selectedModels.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.weekCollectionView.register(NBACalenderDateCell.self)
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
        
        
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as NBACalenderDateCell
        cell.cellDate = nil
        cell.backgroundColor = UIColor.green.withAlphaComponent(0.8)
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
