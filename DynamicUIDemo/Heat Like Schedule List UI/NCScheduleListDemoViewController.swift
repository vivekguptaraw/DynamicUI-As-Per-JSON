//
//  NCScheduleListDemoViewController.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 07/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class NCScheduleListDemoViewController: UIViewController {
    var gameModelsArray: [GameDetailModel] = []
    let json = jsonGameScheduleDict
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Schedule List Component Demo"
        var frm = self.view.frame
        frm.origin = CGPoint(x: 0, y: 0)
        frm.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - self.navigationController!.navigationBar.frame.height - 20)
        let customView = NCScheduleListView(frame: frm)        
        for obj in json{
            let model = GameDetailModel(json: obj)
            gameModelsArray.append(model)
        }
        customView.gameModelsArray = gameModelsArray
        customView.loadData()
        self.view.addSubview(customView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

