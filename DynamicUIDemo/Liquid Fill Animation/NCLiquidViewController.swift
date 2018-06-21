//
//  NCLiquidViewController.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 20/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class NCLiquidViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let liquidVw = NCLiquidView(frame: CGRect(x: 20, y: 20, width: 250, height: 250))
        liquidVw.center = self.view.center
        let imageView = UIImageView(image: UIImage(named: "TransparentLogo"))
        imageView.contentMode = .scaleAspectFill
        imageView.frame = liquidVw.frame
        self.view.addSubview(liquidVw)
        self.view.addSubview(imageView)
        
        imageView.layer.cornerRadius = imageView.frame.width / 2
        var timer = Timer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (t) in
            //MARK: set fillAll to true to immediately fill the background loader
            liquidVw.fillAll = true
            t.invalidate()
        })
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
