//
//  ScheduleDemoViewController.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 29/05/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class ScheduleDemoViewController: UIViewController {
    var gameModelsArray: [GameDetailModel] = []
    let json = jsonGameScheduleDict
    override func viewDidLoad() {
        super.viewDidLoad()
        var frm = self.view.frame
        frm.origin = CGPoint(x: 0, y: 0)
        frm.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - self.navigationController!.navigationBar.frame.height - 20)
        //MARK: Instantiate Schedule Calender view, Set models array and call loadData(). That's it.
        let customView = NBAScheduleExpandableView(frame: frm)
        for obj in json{
            let model = GameDetailModel(json: obj)
            gameModelsArray.append(model)
        }
        customView.gameModelsArray = gameModelsArray
        customView.loadData()
        self.view.addSubview(customView)
        self.title = "Schedule Calender Component Demo"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
