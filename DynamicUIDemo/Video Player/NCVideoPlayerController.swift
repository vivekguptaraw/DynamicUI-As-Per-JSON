//
//  NCVideoPlayerController.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 19/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit
import AVKit

class NCVideoPlayerController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        let player = AVPlayer(url: videoURL!)
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = self.view.bounds
//        self.view.layer.addSublayer(playerLayer)
//        player.play()
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
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
