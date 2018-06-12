 //
//  NCScheduleListView.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 07/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit
var headerAndMonthsBGcolor: UIColor = UIColor.lightGray.withAlphaComponent(0.8)
class NCScheduleListView: UIView {
    var gameCollectionView: UICollectionView!
    var topFixedHeaderView: UIView = UIView()
    var gameModelsArray: [GameDetailModel] = []
    var sortedScheduleDate: [String]  = [String]()
    private var dateFormatter   = DateFormatter()
    private var calendar        = Calendar.autoupdatingCurrent
    let cellIdentifier = "NCScheduleListCell"
    let monthCellIdentifier = "NCMonthCollectionCell"
    var normalCellHeight: CGFloat = UIScreen.main.bounds.width / 2.5
    var centerMonthButton: UIButton = UIButton()
    var expandableMonthView: UIView = UIView()
    var monthCollectionView: UICollectionView!
    let monthCollectionCellWidth: CGFloat = (UIScreen.main.bounds.width / 3) - 20
    var shoulShowMonthsView: Bool = true
    var selectedMonthIndex: Int = 0
    var isFirstTimeMonthsShowing: Bool = true
    var monthCollHeight: CGFloat = 140
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func loadData(){
        self.createViewAndAddSubview()
        self.fillMonthWiseCollectionView()
        self.addCenterMonthButton()
        self.addMonthViewAfterDelay()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        centerMonthButton.sizeToFit()
        //centerMonthButton.frame = CGRect(x: (topFixedHeaderView.frame.width - centerMonthButton.frame.width) / 2, y: (topFixedHeaderView.frame.height - 30) / 2, width: centerMonthButton.frame.width, height: 30)
        centerMonthButton.frame.size = CGSize(width: 100, height: 34)
        centerMonthButton.center = topFixedHeaderView.center
    }
    
    func addCenterMonthButton(){
        centerMonthButton.addTarget(self, action: #selector(NCScheduleListView.centerMonthButtonClicked(_:)), for: .touchUpInside)
        topFixedHeaderView.addSubview(centerMonthButton)
    }
    
    @objc func centerMonthButtonClicked(_ sender: UIButton){
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
            
            self.frameExapandableAnimateableView(shoulShow: self.shoulShowMonthsView ? true: false)
            if self.monthCollectionView != nil{
                self.monthCollectionView.frame = CGRect(x: 0, y: 0, width: self.expandableMonthView.frame.width, height: self.shoulShowMonthsView ? self.expandableMonthView.frame.height : 0)
            }
            
        }) { (bool) in
            if self.isFirstTimeMonthsShowing{
                self.createMonthCollectionView()
                self.isFirstTimeMonthsShowing = false
            }else{
                if self.shoulShowMonthsView{
                    self.monthCollectionView.reloadData()
                }else{
                    
                }
            }
        }        
        self.shoulShowMonthsView = !self.shoulShowMonthsView
    }
    
    func reloadMonthCollectionWithCallback(completion: @escaping (() -> Void)){ //() -> Swift.Void
        self.createMonthCollectionView()
        completion()
    }
    
    func createMonthCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: monthCollectionCellWidth, height: 34)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        monthCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: expandableMonthView.frame.width, height: expandableMonthView.frame.height), collectionViewLayout: layout)
        if monthCollectionView.superview == nil{
            expandableMonthView.addSubview(monthCollectionView)
        }
        self.monthCollectionView.backgroundColor = headerAndMonthsBGcolor
        self.monthCollectionView.register(NCMonthCollectionCell.self, forCellWithReuseIdentifier: self.monthCellIdentifier)
        self.monthCollectionView.dataSource = self
        self.monthCollectionView.delegate = self
        self.reloadMonthCollectionVw()
    }
    
    func frameExapandableAnimateableView(shoulShow: Bool){
        expandableMonthView.frame = CGRect(x: 0, y: 44, width: UIScreen.main.bounds.width, height: shoulShow ? monthCollHeight : 0)

//        if self.monthCollectionView != nil{
//            self.monthCollectionView.isHidden = self.shoulShowMonthsView ? false : true
//        }
    }
    
    func reloadMonthCollectionVw(){
        monthCollectionView.reloadData()
    }
    
    func createViewAndAddSubview(){
        self.topFixedHeaderView.translatesAutoresizingMaskIntoConstraints = false
        self.addConstarintsToTopHeaderView(parentView: self, myView: self.topFixedHeaderView)
        self.addSubview(topFixedHeaderView)
        self.topFixedHeaderView.backgroundColor = UIColor.lightGray
        let layout = NCGameScheduleListLayout()
        layout.delegate = self
        self.gameCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: self.frame.height - 44), collectionViewLayout: layout)
        gameCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraintsToTableView(parentView: self, myView: gameCollectionView)
        self.addSubview(gameCollectionView)
        gameCollectionView.register(UINib(nibName: cellIdentifier , bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }
    
    func addMonthViewAfterDelay(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
            self.frameExapandableAnimateableView(shoulShow: false)
            self.expandableMonthView.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
            self.addSubview(self.expandableMonthView)
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fillMonthWiseCollectionView(){
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
        self.centerMonthButton.setTitle(NCScheduleListView.setHeaderMonthNameAs3Alphabet(monthYear: sortedScheduleDate.first ?? ""), for: .normal)
        self.centerMonthButton.tag = 0
        self.gameCollectionView.dataSource = self
        self.gameCollectionView.reloadData()
    }
    
    class func setHeaderMonthNameAs3Alphabet(monthYear: String) -> String{
        var str = ""
        let datFmt = DateFormatter()
        datFmt.dateFormat = "yyyyMM"
        let monthNameArray = monthYear.components(separatedBy: "-")
        if monthNameArray.count > 0 {
            let monthAbbr = datFmt.shortMonthSymbols[Int(monthNameArray[1])! - 1].uppercased()
            str = monthAbbr
        }
        return str
    }
    
    
    func addConstarintsToTopHeaderView(parentView: UIView, myView: UIView){
        parentView.addConstraint(NSLayoutConstraint(item: myView, attribute: .top, relatedBy: .equal, toItem: parentView, attribute: .top, multiplier: 1, constant: 0))
        parentView.addConstraint(NSLayoutConstraint(item: myView, attribute: .left, relatedBy: .equal, toItem: parentView, attribute: .left, multiplier: 1, constant: 0))
        parentView.addConstraint(NSLayoutConstraint(item: myView, attribute: .right, relatedBy: .equal, toItem: parentView, attribute: .right, multiplier: 1, constant: 0))
        myView.addConstraint(NSLayoutConstraint(item: myView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 44))

    }
    
    func addConstraintsToTableView(parentView: UIView, myView: UIView){
        parentView.addConstraint(NSLayoutConstraint(item: myView, attribute: .top, relatedBy: .equal, toItem: self.topFixedHeaderView, attribute: .bottom, multiplier: 1, constant: 0))
        parentView.addConstraint(NSLayoutConstraint(item: myView, attribute: .bottom, relatedBy: .equal, toItem: parentView, attribute: .bottom, multiplier: 1, constant: 0))
        parentView.addConstraint(NSLayoutConstraint(item: myView, attribute: .left, relatedBy: .equal, toItem: parentView, attribute: .left, multiplier: 1, constant: 0))
        parentView.addConstraint(NSLayoutConstraint(item: myView, attribute: .right, relatedBy: .equal, toItem: parentView, attribute: .right, multiplier: 1, constant: 0))
    }
    
    private func getArrayForMonth (_ monthYear: String) -> [GameDetailModel] {
        return self.gameModelsArray.filter({[weak self] (gameDetail) -> Bool in
            if let slf = self {
                slf.dateFormatter.dateFormat = "yyyy-MM"
                if let gdate = gameDetail.gdte {
                    if slf.dateFormatter.string(from: gdate) == monthYear {
                        return true
                    }
                }
            }
            return false
        })
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.isEqual(self.gameCollectionView){
            if let lastIndexPath = self.gameCollectionView.indexPathsForVisibleItems.last{
                
            }
        }
    }
    
}

extension NCScheduleListView: NCGameScheduleListLayoutDelegate{
    func collectionViewheightForHeader(indexPath: IndexPath) -> CGFloat {
        return 0
    }
    
    func collectionViewHeightforCell(indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 5{
            return normalCellHeight + 58
        }
        return normalCellHeight
    }
    
    
}

extension NCScheduleListView: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView.isEqual(gameCollectionView){
            return self.sortedScheduleDate.count
        }else{
            return 1
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.isEqual(gameCollectionView){
            let gameModelCount = self.getArrayForMonth(self.sortedScheduleDate[section]).count
            return gameModelCount
        }else{
            return self.sortedScheduleDate.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView.isEqual(monthCollectionView){
            
            collectionView.reloadItems(at: [indexPath])
//            if self.isFirstTimeMonthsShowing{
//                collectionView.reloadItems(at: [indexPath])
//                if indexPath.item == self.sortedScheduleDate.count - 1{
//                    self.isFirstTimeMonthsShowing = false
//                }
//            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.isEqual(gameCollectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! NCScheduleListCell
            cell.updateConstraintsAsPerButton(indexPath: indexPath, isLast: indexPath.item == 5 ? true : false)
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: monthCellIdentifier, for: indexPath) as! NCMonthCollectionCell
            cell.indexPath = indexPath
            cell.updateData(month: NCScheduleListView.setHeaderMonthNameAs3Alphabet(monthYear: self.sortedScheduleDate[indexPath.item]), indexPath: IndexPath(item: self.selectedMonthIndex, section: 0))
            return cell
        }
        
    }
}
 extension NCScheduleListView: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.gameCollectionView.scrollToItem(at: IndexPath(item: 0 , section: indexPath.item), at: .top, animated: true)
        if collectionView.isEqual(monthCollectionView){
            collectionView.reloadData()
        }
        self.centerMonthButton.setTitle( NCScheduleListView.setHeaderMonthNameAs3Alphabet(monthYear: self.sortedScheduleDate[indexPath.item]), for: .normal)
        self.selectedMonthIndex = indexPath.item
    }
 }
