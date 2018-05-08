//
//  WithoutTableViewController.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 07/05/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class WithoutTableViewController: UIViewController {
    var tableData = [TableData]()
    var scrollView = UIScrollView()
    var recentInsertedView = UIView()
    var navBarHt: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
         self.title = "Dynamic UI Demo Using ViewController"
        if let _nav = self.navigationController{
            navBarHt = _nav.navigationBar.frame.height
        }
        self.scrollView = UIScrollView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - navBarHt)))
        self.view.addSubview(self.scrollView)
        self.getData()
    }
    
    func getData(){
        var yPos: CGFloat = 0
        DataManager.shared.readDataForCell { (tabledata) in
            print(tabledata)
            self.tableData = tabledata
            DispatchQueue.main.async {[weak self] in
                guard let slf = self else{
                    return
                }
                for _tableData in slf.tableData{
                    for obj in _tableData.dataSourceArray{
                        let customViewForCell = CustomGeneratedView(modelDataArray: obj, cellSize: _tableData.cellSize, observer: slf)
                        if !customViewForCell.isCarousel{
                            slf.scrollView.addSubview(customViewForCell)
                            customViewForCell.frame.origin = CGPoint(x: 0, y: yPos)
                            slf.recentInsertedView = customViewForCell
                            yPos += customViewForCell.frame.height
                            slf.scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: customViewForCell.frame.maxY)
                        }
                        slf.setButtonTarget(viewArray: obj)
                    }
                }
                
            }
        }
        
    }
    
    func setButtonTarget(viewArray: [ControlCreateModel]){
        for item in viewArray{
            if item.controlType == .Button{
                if let btn = item.control as? ButtonControlView{
                    if let button = btn.buttonView{
                        button.addTarget(self, action: #selector(WithoutTableViewController.buttonClicked(_:)), for: .touchUpInside)
                    }
                }
            }
            if let childArray = item.childControlsArray{
                self.setInternalButtonObjectTarget(array: childArray)
            }
            
        }
    }
    
    func setInternalButtonObjectTarget(array: [NSObject]){
        array.map{[weak self] child in
            if child.isKind(of: ButtonControlView.self){
                let childBtnVw = child as! ButtonControlView
                if let chldBtn = childBtnVw.buttonView{
                    chldBtn.addTarget(self, action: #selector(WithoutTableViewController.buttonClicked(_:)), for: .touchUpInside)
                }
            }else if child.isKind(of: UIViewControlView.self){
                let vw = child as! UIViewControlView
                if vw.childControlsArray.count > 0{
                    guard let slf = self else{ return}
                    slf.setInternalButtonObjectTarget(array: vw.childControlsArray)
                }
            }
        }
    }
    
    @objc func buttonClicked(_ sender: ExtendedButton){
        print(sender.parameter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
