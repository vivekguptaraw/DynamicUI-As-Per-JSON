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
        self.view.addSubview(cust)
        cust.frame = CGRect(origin: CGPoint(x: 0, y: 100), size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 1.5475578406 + 103 + (yMarginForShotTrakerView + heightForQuartersView)))
        cust.setPlayByPlay(visitor: jsonPlayByPlay1, home: jsonPlayByPlay2)
        cust.period = 8
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


extension Int {
    func getPeriodNameForPeriod () -> String{
        switch (self) {
        case 0...3:
            return "Q\(self + 1)"
        default:
            return "OT\(self - 3)"
        }
    }
}
