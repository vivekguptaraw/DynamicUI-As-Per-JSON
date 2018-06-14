//
//  NCRosterDemoViewController.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 14/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class NCRosterDemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var frm = self.view.frame
        frm.origin = CGPoint(x: 0, y: 0)
        frm.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - self.navigationController!.navigationBar.frame.height - 20)
        let rosterView = NCRosterListUI(frame: frm)
        let json = jsonPlayerModel
        var playerArr: [NCPlayerDataModel] = []
        for obj in json{
            let model = NCPlayerDataModel(json: obj)
            playerArr.append(model)
        }
        rosterView.playerDataArray = playerArr
        var coachArr: [NCCoachDataModel] = []
        for obj in jsonCoaches{
            let model = NCCoachDataModel(json: obj)
            coachArr.append(model)
        }
        rosterView.coachesDataArray = coachArr
        rosterView.createControls()
        self.view.addSubview(rosterView)
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
