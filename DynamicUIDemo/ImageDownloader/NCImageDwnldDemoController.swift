//
//  NCImageDwnldDemoController.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 18/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class NCImageDwnldDemoController: UIViewController {
    var url: String = "https://www.dropbox.com/s/h23p4h3eft7h2a2/birds-2.jpg?dl=0"//"https://i.cdn.turner.com/nba/big/teams/kings/2018/06/16/2142067/1529107953269-AnatomyScreen_Nutrition.jpg-2142067.576x324.jpg"///Users/vivekgupta/Desktop/Projects/DynamicUI/DynamicUI-As-Per-JSON/DynamicUIDemo/ImageDownloader/birds.jpg
    var localUrl = "file:///Users/vivekgupta/Desktop/Projects/DynamicUI/DynamicUI-As-Per-JSON/DynamicUIDemo/ImageDownloader/kings12.jpg"
    var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView()
        imageView.backgroundColor = UIColor.yellow
        imageView.image = UIImage(named: "placeholder")
        self.view.addSubview(imageView)
//        imageView.loadImage(urlString: localUrl, shouldReload: false) { (uiImage) in
//            DispatchQueue.main.async {
//                self.viewDidLayoutSubviews()
//            }
//        }
//        imageView.loadImage(usingNSCache: localUrl, shouldReload: false, completion: { (image) in
//            DispatchQueue.main.async {
//                self.viewDidLayoutSubviews()
//            }
//        }) { (urlString, image) in
//            DispatchQueue.main.async {
//                self.viewDidLayoutSubviews()
//            }
//        }
        imageView.loadOrUpadateImage(with: localUrl, shouldReload: false, completion: { (image) in
            DispatchQueue.main.async {
                self.viewDidLayoutSubviews()
            }
        }) { (urlString, image) in
            DispatchQueue.main.async {
                self.viewDidLayoutSubviews()
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = CGRect(x: 50, y: 50, width: 300, height: 300)
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
