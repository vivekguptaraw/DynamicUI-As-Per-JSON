//
//  ScreenViewController.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 19/04/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class ScreenViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let identifier = "dynamicCellIdentifier"
    var screenDataArray: [ControlCreateModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.readData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createDict(data: [String: Any]){
        
    }
    
    func readData(){
        DataManager.shared.readData { (array) in
            self.screenDataArray = array
            self.collectionView.reloadData()
        }
        
    }
    
    func createCell(data: [String: Any], indexPath: IndexPath){
        
    }
    
}
extension ScreenViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let model = self.screenDataArray[indexPath.row]
        if model.controlType == .Label{
            let control = model.control as! LabelControlView
            if let lbl = control.labelView{
                lbl.sizeToFit()
                model.size = CGSize(width: model.size.width, height: lbl.frame.height * 4)
            }            
        }
        let size = model.size        
        return size
    }
}

extension ScreenViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! DynamicCollectionViewCell
        cell.createControl(model: self.screenDataArray[indexPath.row])
        cell.backgroundColor = UIColor.gray
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.screenDataArray.count
    }
}

extension ScreenViewController: UICollectionViewDelegate{
    
}

