//
//  BiDirectionalViewController.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 09/05/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class BiDirectionalViewController: UIViewController {
    let leftTableView: UITableView = UITableView()
    let rightTableView: UITableView = UITableView()
    let leftCellIdentifier = "leftCell"
    let rightCellIdentifier = "rightCell"
    let dataSource = arrayForBirectional
    let leftTableArray: [String] = Array(arrayForBirectional.keys)
    var rightTableArray: [[Int]] = []
    let scrollView: UIScrollView = UIScrollView()
    var rightTableOffset = CGPoint.zero
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "HRScrollTable"
        leftTableView.register(UINib.init(nibName: "LeftTableViewCell", bundle: nil), forCellReuseIdentifier: leftCellIdentifier)
        rightTableView.register(UINib.init(nibName: "RightTableViewCell", bundle: nil), forCellReuseIdentifier: rightCellIdentifier)
        // Do any additional setup after loading the view.
        self.view.addSubview(leftTableView)
        self.scrollView.addSubview(rightTableView)
        self.view.addSubview(scrollView)
        
        leftTableView.dataSource = self
        leftTableView.delegate = self
        rightTableView.dataSource = self
        rightTableView.delegate = self
        dataSource.map{
            if let _rightArray = $0.value as? [Int]{
                self.rightTableArray.append(_rightArray)
            }
        }
        self.leftTableView.backgroundColor = UIColor.lightGray
        self.rightTableView.backgroundColor = UIColor.hexStringToUIColor(hex: "DCDCDC")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let leftTableWidth = UIScreen.main.bounds.width / 3.5
        let rightTableWidth = UIScreen.main.bounds.width - leftTableWidth
        let tableHeight = UIScreen.main.bounds.height - 50
        self.leftTableView.frame = CGRect(x: 0, y: 0, width: leftTableWidth, height: tableHeight)
        self.rightTableView.frame = CGRect(x: 0, y: 0, width: 1000, height: tableHeight)
        self.scrollView.frame = CGRect(x: self.leftTableView.frame.maxX, y: 0, width: rightTableWidth, height: tableHeight)
        self.scrollView.contentSize = self.rightTableView.frame.size
        self.leftTableView.reloadData()
        self.rightTableView.reloadData()
        self.leftTableView.separatorStyle = .none
        self.rightTableView.separatorStyle = .none
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var storedOffsets = CGFloat()
}

protocol ScrollDelegate: class {
    func didScroll(to position: CGFloat, rowNum: Int)
}

extension BiDirectionalViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView)
        if let _ = scrollView as? UITableView{
            (self.leftTableView as UIScrollView).contentOffset = scrollView.contentOffset
            //(self.rightTableView as UIScrollView).contentOffset = scrollView.contentOffset
        }
    }
}



extension BiDirectionalViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == leftTableView{
            return leftTableArray.count
        }else{
            return rightTableArray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == leftTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: leftCellIdentifier, for: indexPath) as! LeftTableViewCell
            cell.labelText.text = "\(leftTableArray[indexPath.row])"
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: rightCellIdentifier, for: indexPath) as! RightTableViewCell
            cell.layer.shouldRasterize = false;
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView == rightTableView{
            guard let rightCell = cell as? RightTableViewCell else{return}
            rightCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            rightCell.collectionViewOffset = storedOffsets
        }
    }
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let rightCell = cell as? RightTableViewCell else { return }        
        storedOffsets = rightCell.collectionViewOffset
    }
}
extension BiDirectionalViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rightTableArray[collectionView.tag].count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rightCollectionCell", for: indexPath) as! RightCollectionViewCell
        cell.labelText.text = "\(rightTableArray[collectionView.tag][indexPath.row])"
        return cell
    }
}

extension BiDirectionalViewController: UITableViewDelegate{
    
}
