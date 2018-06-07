//
//  NBAScheduleExpandableView.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 28/05/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit
var SCHEDULEHEIGHT: CGFloat   = 160
var KEYCOLOR: UIColor = .red

class NBAScheduleExpandableView: UIView {
    
    private var dateFormatter   = DateFormatter()
    private var calendar        = Calendar.autoupdatingCurrent
    
    var tableView: UITableView!
    var gameModelsArray: [GameDetailModel] = []
    var sortedScheduleDate: [String]  = [String]()
    private var selectedIndexPath: IndexPath?
    private var selectedModels: [GameDetailModel]?
    private var selectedDate: Date?
    
    private var segmentedControl: NCScrollableSegmentedControl!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.tableView = UITableView(frame: CGRect(origin: self.bounds.origin, size: self.frame.size))
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor.white
        tableView.register(NBACalenderWeekCell.self)
        self.tableView.register(NBAGameScheduleHeaderView.self)
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
        
        segmentedControl = NCScrollableSegmentedControl()
        segmentedControl.segmentStyle = .textOnly
        let datFmt = DateFormatter()
        datFmt.dateFormat = "yyyyMM"
        let date = datFmt.string(from: Date())
        var index = 0
        var segmentArray = [String]()
        for (indx, monthName) in self.sortedScheduleDate.enumerated() {
            if let month = Int(monthName.replacingOccurrences(of: "-", with: "")), let currentMonth = Int(date) {
                if month < currentMonth {
                    index += 1
                }
            }
            let monthNameArray = monthName.components(separatedBy: "-")
            if monthNameArray.count > 0 {
                let monthAbbr = datFmt.shortMonthSymbols[Int(monthNameArray[1])! - 1].uppercased()
                segmentArray.append(monthAbbr)
              self.segmentedControl.insertSegment(withTitle: monthAbbr, at: indx)
            }
        }
        self.segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraintsToSegmentView(parentView: self, segmentVw: segmentedControl)
        self.addConstraintsToTableView(parentView: self, myView: tableView)
        self.addSubview(self.segmentedControl)
        self.addSubview(self.tableView)
        self.segmentedControl.addTarget(self, action: #selector(NBAScheduleExpandableView.segmentSelected(sender:)), for: .valueChanged)
        self.segmentedControl.selectedSegmentContentColor = KEYCOLOR
        self.segmentedControl.segmentContentColor = UIColor.darkGray
    }
    
    @objc func segmentSelected(sender: NCScrollableSegmentedControl){
        print(sender.selectedSegmentIndex)
        if !isScrolling{
            self.tableView.scrollToRow(at: IndexPath(item: 0, section: sender.selectedSegmentIndex), at: .top, animated: true)
        }
    }
    
    func addConstraintsToSegmentView(parentView: UIView, segmentVw: UIView){
        parentView.addConstraint(NSLayoutConstraint(item: segmentVw, attribute: .top, relatedBy: .equal, toItem: parentView, attribute: .top, multiplier: 1, constant: 0))
        parentView.addConstraint(NSLayoutConstraint(item: segmentVw, attribute: .left, relatedBy: .equal, toItem: parentView, attribute: .left, multiplier: 1, constant: 0))
        parentView.addConstraint(NSLayoutConstraint(item: segmentVw, attribute: .right, relatedBy: .equal, toItem: parentView, attribute: .right, multiplier: 1, constant: 0))
        self.segmentedControl.addConstraint(NSLayoutConstraint(item: segmentVw, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 44))
    }
    
    
    func addConstraintsToTableView(parentView: UIView, myView: UIView){
        parentView.addConstraint(NSLayoutConstraint(item: myView, attribute: .top, relatedBy: .equal, toItem: segmentedControl, attribute: .bottom, multiplier: 1, constant: 0))
        parentView.addConstraint(NSLayoutConstraint(item: myView, attribute: .bottom, relatedBy: .equal, toItem: parentView, attribute: .bottom, multiplier: 1, constant: 0))
        parentView.addConstraint(NSLayoutConstraint(item: myView, attribute: .left, relatedBy: .equal, toItem: parentView, attribute: .left, multiplier: 1, constant: 0))
        parentView.addConstraint(NSLayoutConstraint(item: myView, attribute: .right, relatedBy: .equal, toItem: parentView, attribute: .right, multiplier: 1, constant: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var isScrolling: Bool = false
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.isEqual(self.tableView){
            isScrolling = true
            if let array = self.tableView.indexPathsForVisibleRows{
                let tabToBeScrolled = array[0].section
                if array.last!.section == self.tableView.numberOfSections - 1{
                    self.segmentedControl.selectedSegmentIndex = tabToBeScrolled + 1
                }else{
                    self.segmentedControl.selectedSegmentIndex = tabToBeScrolled
                }
            }
        }
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        self.isScrolling = false
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.isScrolling = false
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.isScrolling = false
    }
}

extension NBAScheduleExpandableView: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sortedScheduleDate.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weeksOfMonth(month: self.sortedScheduleDate[section])
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let date = Date()
        dateFormatter.dateFormat = "yyyyMM"
        let dateString = dateFormatter.string(from: date)
        let calendarDate = self.sortedScheduleDate[section].replacingOccurrences(of: "-", with: "")
        if Int(dateString)! <= Int(calendarDate)! {
            return self.height + 60
        }
        
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = tableView.dequeReusableHeaderFooter(NBAGameScheduleHeaderView.self) as NBAGameScheduleHeaderView
        sectionHeader.monthLabel.text = self.sortedScheduleDate[section].getMonthYear().uppercased()
        let date = Date()
        dateFormatter.dateFormat = "yyyyMM"
        let dateString = dateFormatter.string(from: date)
        let calendarDate = self.sortedScheduleDate[section].replacingOccurrences(of: "-", with: "")
        
        return sectionHeader
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
            flowLayout.minimumInteritemSpacing = 1
            flowLayout.minimumLineSpacing = 1
        }
        let mothYearArray   = self.sortedScheduleDate[indexPath.section].components(separatedBy: "-")
        cell.monthName      = mothYearArray[1]
        cell.weekDate       = self.sortedScheduleDate[indexPath.section].getFirstDate(weekNumber: indexPath.row + 1)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let selected = self.selectedIndexPath {
            if selected == indexPath {
                return self.bounds.width / 7 + SCHEDULEHEIGHT + 10
            }
        }
        return self.bounds.width / 7
    }
}

extension NBAScheduleExpandableView : NBACalendarDateCellDelegate{
    func canSelectDate(_ date: Date) -> [Any] {
        return self.gameModelsArray.filter({ (gamedetail) -> Bool in
            return (gamedetail.gdte?.compare(date) == ComparisonResult.orderedSame || (gamedetail.gdte?.compare(date) == ComparisonResult.orderedDescending && gamedetail.gdte?.compare(date.addingTimeInterval(86400)) == ComparisonResult.orderedAscending))
        })
    }
    
    func didSelectDate(_ date: Date, indexPath: IndexPath) -> [Any] {
        if let selected = self.selectedIndexPath, let sDate = self.selectedDate {
            if selected == indexPath && sDate.compare(date) == ComparisonResult.orderedSame {
                self.selectedIndexPath  = nil
                self.selectedDate       = nil
                self.selectedModels     = nil
                self.tableView.beginUpdates()
                self.tableView.endUpdates()
                return [GameDetailModel]()
            }
        }
        self.selectedIndexPath = indexPath
        self.selectedDate = date
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        self.selectedModels = self.gameModelsArray.filter({ (gamedetail) -> Bool in
            return (gamedetail.gdte?.compare(date) == ComparisonResult.orderedSame || (gamedetail.gdte?.compare(date) == ComparisonResult.orderedDescending && gamedetail.gdte?.compare(date.addingTimeInterval(86400)) == ComparisonResult.orderedAscending))
        })
        return self.selectedModels!
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
    func getMonthYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "MMMM YYYY"
        return dateFormatter.string(from: date!)
    }
}
