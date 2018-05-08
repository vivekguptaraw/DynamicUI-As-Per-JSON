//
//  TableViewCustomController.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 26/04/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit



class TableViewCustomController: UIViewController {
    let tableView = UITableView()
    var navBarHt: CGFloat = 0
    var tableData = [TableData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createAndAddTable()
        self.getData()
        self.tableView.backgroundColor = UIColor.hexStringToUIColor(hex: "171B27")
    }
    
    func createAndAddTable(){
        if let _nav = self.navigationController{
            navBarHt = _nav.navigationBar.frame.height
            self.title = "Dynamic UI Demo Using TableView"
        }
        self.tableView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - navBarHt - 20))
        self.view.addSubview(self.tableView)
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor.black
        
    }
    
    func getData(){
        DataManager.shared.readDataForCell { (tabledata) in
            print(tabledata)
            self.tableData = tabledata
            DispatchQueue.main.async {[weak self] in
                guard let slf = self else{
                    return
                    
                }
                slf.tableView.reloadData()
                
            }
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension TableViewCustomController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableData[indexPath.row].cellSize.height
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath as IndexPath) as! CustomCell
        cell.cellSize = self.tableData[indexPath.row].cellSize
        cell.tableData = self.tableData[indexPath.row]
        //cell.selectionStyle = .none
        return cell
    }
}

extension TableViewCustomController: UITableViewDelegate{
    
}

class CustomCell: UITableViewCell {
    var cellSize = CGSize.zero
    var dataSoucre: [String]?
    var tableData: TableData?{
        didSet{
            if let _tableData = tableData{
                for obj in _tableData.dataSourceArray{
                    let customViewForCell = CustomGeneratedView(modelDataArray: obj, cellSize: self.cellSize, observer: self)
                    if !customViewForCell.isCarousel{
                        self.addSubview(customViewForCell)
                    }else{
                        if let dataSoucre = customViewForCell.carouselDataSource{
                            self.dataSoucre = []
                            self.dataSoucre = dataSoucre
                            self.setCollectionView(padding: customViewForCell.padding)
                        }
                    }
                    self.frame.size = customViewForCell.frame.size
                    self.layoutIfNeeded()
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCollectionView(padding: CGFloat){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        layout.itemSize = self.frame.size
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let myCollectionView:UICollectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        myCollectionView.dataSource = self
        myCollectionView.isPagingEnabled = true
        myCollectionView.delegate = self
        myCollectionView.register(SlideCollectionViewCell.self, forCellWithReuseIdentifier: "SlideCell")
        myCollectionView.backgroundColor = UIColor.white
        self.addSubview(myCollectionView)
        myCollectionView.reloadData()
    }
    
    func setData(){
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.cellSize = CGSize.zero
        for vw in self.subviews{
            if vw.superview != nil{
                vw.removeFromSuperview()
            }
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("selfFrame \(self.frame)")
    }
}

extension CustomCell: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let ds = dataSoucre {
            return ds.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlideCell", for: indexPath as IndexPath) as! SlideCollectionViewCell
        myCell.backgroundColor = UIColor.gray
        if let ds = dataSoucre {
            myCell.setData(imageName: ds[indexPath.row])
        }
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
    }
}

extension CustomCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.frame.height)
    }
}

class SlideCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.addSubview(imageView)
    }
    
    func setData(imageName: String){
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: imageName)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}
