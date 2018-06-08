//
//  NBAScheduleCalenderView.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 24/05/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class GameScheduleModel{
    var date: String!
    var isHomeGame:Bool = false
    var league_id:String = ""
    var visitorTeamAbbre: String = ""
    var homeTeamAbbre: String = ""
    
    init() {
    }
}

struct GameDate {
    var gameModel : GameScheduleModel!
    var gameIndexInArray : Int!
    var gameIndexInCollection : Int!
}

protocol CalendarViewDelegate: class {
    func selectedDate(rowInParent : Int, sectionInParent : Int, rowInCollection : Int)
}

class NBAScheduleCalenderView: UIView {
    
    var collectionView: UICollectionView!
    var dayWiseGameModelDictionary: [String: GameDate] = [:]
    var model: DateModel = .init()
    var scheduleListPerMonth : [GameScheduleModel] = []
    weak var delegate: CalendarViewDelegate?
    var parentSectionId : Int!
    var monthYear : String!
    var isFirstTime : Bool = false
    let cellIdenfier = "CalendarCell"
    
    public init(frame : CGRect,monthYear : String, scheduleArray : [GameScheduleModel], controller : NBACalenderDemoViewController, selectedGameIndexPath : IndexPath?, isFirstTime : Bool, indexPath : IndexPath, section: Int){
        
        super.init(frame: frame)
        let viewLayout = CalendarViewLayout(inset: .zero, cellSpace: 0.2, sectionSpace: 0.0, parentHeight: self.frame.height, maxRowCount: 6)
        collectionView = UICollectionView(frame: frame, collectionViewLayout: viewLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        self.delegate = controller
        self.parentSectionId = indexPath.section
        self.monthYear = monthYear
        self.scheduleListPerMonth = scheduleArray
        generateDictionaryAsPerDay()
        self.configureCollectionView()
        self.addSubview(collectionView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = self.bounds
    }
    
    func generateDictionaryAsPerDay(){
        for (index, model) in self.scheduleListPerMonth.enumerated(){
            let gDate = Date(fromString: model.date!)
            guard let dt = gDate else{ return}
            let day = dt.toString(format: "d")
            var gameDate = GameDate()
            gameDate.gameModel = model
            gameDate.gameIndexInArray = index
            self.dayWiseGameModelDictionary[day] =  gameDate
        }
    }
    
    func configureCollectionView() {
        model.displayByMonth(in: monthYear)
        self.backgroundColor = UIColor.gray
        setLayoutCollectionView()
        self.collectionView.register(CalenderCell.self, forCellWithReuseIdentifier: cellIdenfier)
        self.collectionView.reloadData()
    }
    
    func setLayoutCollectionView() {
        let days = model.indexAtEnd(in: .next)!
        var count = 0
        if days >= 28 && days < 35 {
            count = 5
        } else if days >= 35 && days < 42 {
            count = 6
        } else {
            count = 4
        }
        self.layoutSubviews()
        let viewLayout = CalendarViewLayout(inset: .zero, cellSpace: 0.1, sectionSpace: 0.1, parentHeight: self.collectionView.frame.height, maxRowCount: count)
        self.collectionView.setCollectionViewLayout(viewLayout, animated: false)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var selectedIndexPath: IndexPath?
}

extension NBAScheduleCalenderView: UICollectionViewDataSource, UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? DateModel.dayCountPerRow : (DateModel.dayCountPerRow * 6)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdenfier , for: indexPath) as! CalenderCell
        cell.updateCell(indexPath: indexPath, dateModel: model, dayDictionary: &dayWiseGameModelDictionary, isFirstTime: self.isFirstTime, selectedIndex: self.selectedIndexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedIndex = self.selectedIndexPath {
            let prevCell = collectionView.cellForItem(at: selectedIndex) as! CalenderCell
            prevCell.isCellSelected = false
            prevCell.setBorderToSelectedView(shouldAddBorder: false)
            prevCell.layoutSubviews()
        }
        
        let cell = collectionView.cellForItem(at: indexPath) as! CalenderCell
        guard let txt = cell.teamLabel.text, !txt.isEmpty else {return}
        selectedIndexPath = indexPath
        cell.setBorderToSelectedView(shouldAddBorder: true)
        selectedIndexPath = indexPath
        collectionView.reloadItems(at: [indexPath])
        
    }
    
    
}



