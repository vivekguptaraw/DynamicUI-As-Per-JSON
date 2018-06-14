//
//  NCRosterListUI.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 14/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class NCRosterListUI: UIView {

    var segmentedControl: UISegmentedControl!
    var tableView: UITableView!
    let cellIdentifier = "NCRosterTableViewCell"
    var playerDataArray: [NCPlayerDataModel] = []
    var coachesDataArray: [NCCoachDataModel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createControls(){
        segmentedControl = UISegmentedControl(items: ["PLAYERS", "COACHES"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraintsToTopSegmentView(parentView: self, myView: self.segmentedControl)
        self.addSubview(segmentedControl)
        tableView = UITableView(frame: self.bounds)
        tableView.register(NCRosterTableViewCell.self)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraintsToTableView(parentView: self, myView: tableView)
        self.addSubview(tableView)
        tableView.dataSource = self        
        tableView.rowHeight = 95
        segmentedControl.selectedSegmentIndex = 0
        tableView.reloadData()
        segmentedControl.tintColor = KEYCOLOR
        segmentedControl.backgroundColor = UIColor.white
        segmentedControl.isSelected = true
        segmentedControl.addTarget(self, action: #selector(NCRosterListUI.segmentChanged(_:)), for: .valueChanged)
    }
    
    @objc func segmentChanged(_ segmentControl: UISegmentedControl){
        tableView.reloadData()
    }
    
    func addConstraintsToTopSegmentView(parentView: UIView, myView: UIView){
        parentView.addConstraint(NSLayoutConstraint(item: myView, attribute: .top, relatedBy: .equal, toItem: parentView, attribute: .top, multiplier: 1, constant: 10))
        parentView.addConstraint(NSLayoutConstraint(item: myView, attribute: .left, relatedBy: .equal, toItem: parentView, attribute: .left, multiplier: 1, constant: 10))
        parentView.addConstraint(NSLayoutConstraint(item: myView, attribute: .right, relatedBy: .equal, toItem: parentView, attribute: .right, multiplier: 1, constant: -10))
        myView.addConstraint(NSLayoutConstraint(item: myView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 44))
        
    }
    
    func addConstraintsToTableView(parentView: UIView, myView: UIView){
        parentView.addConstraint(NSLayoutConstraint(item: myView, attribute: .top, relatedBy: .equal, toItem: self.segmentedControl, attribute: .bottom, multiplier: 1, constant: 20))
        parentView.addConstraint(NSLayoutConstraint(item: myView, attribute: .bottom, relatedBy: .equal, toItem: parentView, attribute: .bottom, multiplier: 1, constant: 0))
        parentView.addConstraint(NSLayoutConstraint(item: myView, attribute: .left, relatedBy: .equal, toItem: parentView, attribute: .left, multiplier: 1, constant: 0))
        parentView.addConstraint(NSLayoutConstraint(item: myView, attribute: .right, relatedBy: .equal, toItem: parentView, attribute: .right, multiplier: 1, constant: 0))
    }
}

extension NCRosterListUI: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0{
            return playerDataArray.count
        }else{
            return coachesDataArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if segmentedControl.selectedSegmentIndex == 0{
            let cell = tableView.dequeueReusableCell(NCRosterTableViewCell.self, forIndexPath: indexPath)
            cell.updatePlayerData(data: self.playerDataArray[indexPath.row])
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(NCRosterTableViewCell.self, forIndexPath: indexPath)
            cell.updateCoachData(data: self.coachesDataArray[indexPath.row])
            return cell
        }
        
    }
}
