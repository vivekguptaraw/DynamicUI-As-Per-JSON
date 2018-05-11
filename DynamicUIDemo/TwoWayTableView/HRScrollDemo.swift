//
//  HRScrollDemo.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 11/05/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class HRScrollDemo: UIViewController {
    let hrScrollTableView: HRScrollTableView = HRScrollTableView()
    let leftCellIdentifier = "LeftTableViewCell"
    let rightCellIdentifier = "RightTableViewCell"
    let dataSource = arrayForBirectional
    let leftTableArray: [String] = Array(arrayForBirectional.keys)
    var rightTableArray: [[Int]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "HRScrollTable"
        hrScrollTableView.leftTable.register(UINib.init(nibName: "LeftTableViewCell", bundle: nil), forCellReuseIdentifier: leftCellIdentifier)
        hrScrollTableView.rightTable.register(UINib.init(nibName: "RightTableViewCell", bundle: nil), forCellReuseIdentifier: rightCellIdentifier)
        self.view.addSubview(hrScrollTableView)
        self.hrScrollTableView.delegate = self
        self.hrScrollTableView.reloadTables()
        self.hrScrollTableView.leftTableWidth   = 0.35 * UIScreen.main.bounds.width
        var rightCellWidth: CGFloat = 0
        dataSource.map{
            if let _rightArray = $0.value as? [Int]{
                self.rightTableArray.append(_rightArray)
                let arrayWidth = CGFloat(_rightArray.count * 50)
                if arrayWidth > rightCellWidth{
                    rightCellWidth = arrayWidth
                }
            }
        }
         self.hrScrollTableView.rightTableWidth  = rightCellWidth
        self.hrScrollTableView.scrollView.alwaysBounceHorizontal = true
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.3) {
            self.hrScrollTableView.applyRightShadowToLeftTable(view: self.hrScrollTableView.leftTable)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        hrScrollTableView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 54)
       
    }

}

extension HRScrollDemo : HRScrollDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leftTableArray.count
    }
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, willdisplayCellVG cell: UITableViewCell, indexPath: IndexPath) {
        if tableView.isEqual(self.hrScrollTableView.rightTable){
            guard let rightCell = cell as? RightTableViewCell else{return}
            rightCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self.hrScrollTableView, forRow: indexPath.row)
            
        }
    }
    
    func tableView(_ tableView: UITableView, atIndexPath: IndexPath) -> UITableViewCell {
        if tableView.isEqual(self.hrScrollTableView.rightTable){
            let cell = self.hrScrollTableView.rightTable.dequeueReusableCell(RightTableViewCell.self, forIndexPath: atIndexPath)
            
            return cell
        }else{
            let cell = self.hrScrollTableView.leftTable.dequeueReusableCell(LeftTableViewCell.self, forIndexPath: atIndexPath)
            cell.labelText.text = "\(leftTableArray[atIndexPath.row])"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightAtIndexPath: IndexPath)->CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, headerAtSection: Int) -> UIView {
       
        if tableView.isEqual(self.hrScrollTableView.leftTable){
            let lblLeft = UILabel(frame: CGRect(x: 0, y: 0, width: self.hrScrollTableView.leftTable.frame.width, height: 50))
            lblLeft.textAlignment = .center
            lblLeft.text = "Title"
            lblLeft.backgroundColor = UIColor.green
            return lblLeft
        }else{
            let vw = UIView(frame: CGRect(x: 0, y: 0, width: self.hrScrollTableView.rightTable.frame.width, height: 50))
            let lblRight = UILabel()
            lblRight.textAlignment = .left
            lblRight.text = "Right Title"
            lblRight.sizeToFit()
            lblRight.lineBreakMode = .byTruncatingTail
            lblRight.frame = CGRect(x: 50, y: 0, width: lblRight.frame.width, height: 50)
            vw.addSubview(lblRight)
            vw.backgroundColor = UIColor.white
            return vw
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectIndexPath indexPath: IndexPath) {
        print(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSectionVG section: Int) -> Int {
        return rightTableArray[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAtVG indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as RightCollectionViewCell
        cell.labelText.text = "\(rightTableArray[collectionView.tag][indexPath.row])"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectVGItemAt indexPath: IndexPath) {
        print("\(collectionView.tag) \(indexPath)")
    }
    
}
//
//extension HRScrollDemo: UICollectionViewDelegate, UICollectionViewDataSource{
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return rightTableArray[collectionView.tag].count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as RightCollectionViewCell
//        cell.labelText.text = "\(rightTableArray[collectionView.tag][indexPath.row])"
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("\(collectionView.tag) \(indexPath)")
//
//    }
//
//}

