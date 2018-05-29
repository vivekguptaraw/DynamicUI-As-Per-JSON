//
//  NBAScheduleExpandableView.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 28/05/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class NBAScheduleExpandableView: UIView {
    
    private var dateFormatter   = DateFormatter()
    private var calendar        = Calendar.autoupdatingCurrent
    
    var tableView: UITableView!
    var gameModelsArray: [GameDetailModel] = []
    var sortedScheduleDate: [String]  = [String]()
    private var selectedIndexPath: IndexPath?
    private var selectedModels: [GameDetailModel]?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.tableView = UITableView(frame: CGRect(origin: self.bounds.origin, size: self.frame.size))
        self.addSubview(self.tableView)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(parentView: self, myView: tableView)
        tableView.backgroundColor = UIColor.yellow
        tableView.register(NBACalenderWeekCell.self)
        self.tableView.delegate             = self
        self.tableView.dataSource           = self
        
        //
        let json = jsonGameScheduleDict
        for obj in json{
            let model = GameDetailModel(json: obj)
            gameModelsArray.append(model)
        }
        
        
        dateFormatter.dateFormat = "yyyy-MM"
        var gameDate    = Date()
        var lastMonth   = dateFormatter.string(from: Date())
        if let firstGame = gameModelsArray.first {
            gameDate    = firstGame.gdte!
        }
        if let lastGame = gameModelsArray.last {
            lastMonth   = dateFormatter.string(from: lastGame.gdte!)
        }
        sortedScheduleDate = [String]()
        var firstMonth = dateFormatter.string(from: gameDate)
        repeat {
            firstMonth = dateFormatter.string(from: gameDate)
            sortedScheduleDate.append(firstMonth)
            var component = DateComponents()
            component.month = 1
            gameDate = Calendar.current.date(byAdding: component, to: gameDate)!
        }while (firstMonth != lastMonth)
        self.tableView.reloadData()
    }
    
    func addConstraint(parentView: UIView, myView: UIView){
        parentView.addConstraint(NSLayoutConstraint(item: myView, attribute: .top, relatedBy: .equal, toItem: parentView, attribute: .top, multiplier: 1, constant: 0))
        parentView.addConstraint(NSLayoutConstraint(item: myView, attribute: .bottom, relatedBy: .equal, toItem: parentView, attribute: .bottom, multiplier: 1, constant: 0))
        parentView.addConstraint(NSLayoutConstraint(item: myView, attribute: .left, relatedBy: .equal, toItem: parentView, attribute: .left, multiplier: 1, constant: 0))
        parentView.addConstraint(NSLayoutConstraint(item: myView, attribute: .right, relatedBy: .equal, toItem: parentView, attribute: .right, multiplier: 1, constant: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NBAScheduleExpandableView: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sortedScheduleDate.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weeksOfMonth(month: self.sortedScheduleDate[section])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(NBACalenderWeekCell.self, forIndexPath: indexPath) as NBACalenderWeekCell
        cell.delegate       = self
        cell.indexPath      = indexPath
        cell.weekNumber     = indexPath.row
        //cell.collectionHeightConstraint.constant    = self.view.bounds.width / 7
        if let selectedPath  = self.selectedIndexPath {
            if selectedPath == indexPath {
                if let selectModel = self.selectedModels {
                    cell.cellModel = selectModel
                }
            }
        }
        if let flowLayout = cell.weekCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.itemSize = CGSize(width: (self.bounds.width - 8) / 7, height: (self.bounds.width - 8) / 7)
        }
        let mothYearArray   = self.sortedScheduleDate[indexPath.section].components(separatedBy: "-")
        cell.monthName      = mothYearArray[1]
        cell.weekDate       = self.sortedScheduleDate[indexPath.section].getFirstDate(weekNumber: indexPath.row + 1)
        return cell
    }
}

extension NBAScheduleExpandableView : NBACalendarDateCellDelegate{
    func canSelectDate(_ date: Date) -> [Any] {
        return [Any]()
    }
    
    func didSelectDate(_ date: Date, indexPath: IndexPath) -> [Any] {
        return [Any]()
    }
    
    
}

extension NBAScheduleExpandableView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension NBAScheduleExpandableView {
    func weeksOfMonth(month: String) -> Int {
        let dateString = "\(month)-01"
        self.dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = self.dateFormatter.date(from: dateString)
        self.calendar.firstWeekday = 1
        let week = self.calendar.range(of: Calendar.Component.weekOfMonth, in: Calendar.Component.month, for: date!)
        return week!.upperBound - 1
    }
}
extension String{
    func getFirstDate(weekNumber: Int) -> Date {
        let calendar = Calendar.autoupdatingCurrent
        let mothYearArray       = self.components(separatedBy: "-")
        
        var component           = DateComponents()
        component.year          = Int(mothYearArray[0])
        component.month         = Int(mothYearArray[1])
        component.weekOfMonth   = weekNumber
        component.weekday       = calendar.firstWeekday
        return calendar.date(from: component)!
    }
}
