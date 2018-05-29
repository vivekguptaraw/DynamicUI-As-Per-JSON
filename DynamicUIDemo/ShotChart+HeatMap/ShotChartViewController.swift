//
//  ShotChartViewController.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 21/05/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

let yMarginForShotTrakerView: CGFloat = 30
let heightForQuartersView: CGFloat = 50

class ShotChartViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cust = ShotChartCustomView()
        cust.delegate = self
        cust.shotTrackerView.delegate = self
        self.view.addSubview(cust)
        cust.frame = CGRect(origin: CGPoint(x: 0, y: 100), size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 1.5475578406 + 103 + (yMarginForShotTrakerView + heightForQuartersView)))
        cust.setPlayByPlay(visitor: jsonPlayByPlay1, home: jsonPlayByPlay2)
        cust.period = 5
        cust.teamNamesArray = ["Team 1", "Team 2"]
        cust.teamSelected = .Opponent
        self.title = "Shot Chart Component"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
       
    }
}

extension ShotChartViewController: ShotChartMainViewProtocol, ShotChartCliksDelegate{
    func pointsClickedHandler<T, U>(data: T, anotherData: U) {
        print(data)
        print(anotherData)
    }
    
    func quarterSelected<T>(quarter: T) {
        print(quarter)
    }
}
