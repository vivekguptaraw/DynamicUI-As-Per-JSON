//
//  NBACalenderDemoViewController.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 25/05/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class NBACalenderDemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var arr = [GameScheduleModel]()
        for i in 0..<jsonGameSchedule.count{
            let obj = GameScheduleModel()
            let json = jsonGameSchedule[i]
            obj.isHomeGame = json["isHomeGame"] as! Bool
            obj.date = json["date"] as! String
            obj.visitorTeamAbbre = json["visitorTeamAbbre"] as! String
            obj.homeTeamAbbre = json["homeTeamAbbre"] as! String
            arr.append(obj)
        }
        let rect = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 200)
        let calenderView = NBAScheduleCalenderView(frame: rect, monthYear: "2018-04", scheduleArray: arr, controller: self, selectedGameIndexPath: nil, isFirstTime: false, indexPath: IndexPath(row: 5, section: 1), section: 0)
        // Do any additional setup after loading the view.
        self.view.addSubview(calenderView)
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

extension NBACalenderDemoViewController: CalendarViewDelegate{
    func selectedDate(rowInParent: Int, sectionInParent: Int, rowInCollection: Int) {
        
    }
    
    
}

let jsonGameSchedule: [[String: Any]] =
[
[
"isHomeGame" : false,
"date" :  "2018-04-15T05:30:00.000+0530",
"visitorTeamAbbre" : "MIA",
"homeTeamAbbre" : "PHI"

],
[
"isHomeGame" : false,
"date" :  "2018-04-17T05:30:00.000+0530",
"visitorTeamAbbre" : "MIA",
"homeTeamAbbre" : "PHI"

],
[
"isHomeGame" : true,
"date" :  "2018-04-20T04:30:00.000+0530",
"visitorTeamAbbre" : "PHI",
"homeTeamAbbre" : "MIA"

]
,[
"isHomeGame" : true,
"date" :  "2018-04-22T00:00:00.000+0530",
"visitorTeamAbbre" : "PHI",
"homeTeamAbbre" : "MIA"

],
[
"isHomeGame" : false,
"date" :  "2018-04-25T05:30:00.000+0530",
"visitorTeamAbbre" : "MIA",
"homeTeamAbbre" : "PHI"

]
]
