//
//  ShotChartControlView.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 21/05/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import Foundation
import UIKit
import FontAwesome_swift
class ShotChartControlView: UIView {
    
    var height: CGFloat = 0
    var width: CGFloat = 0
    var avgX: CGFloat = 0
    var avgY: CGFloat = 0
    
    var redrawCalled: Bool      = false
    weak var delegate: ShotChartDrawDelegate?
    
    var teamColor: UIColor   = UIColor.orange
    
    init(frame: CGRect, delegate: ShotChartDrawDelegate) {
        self.delegate = delegate
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var playByPlayArray: [PlayByPlay]  = [] {
        didSet {
            self.redrawView()
        }
    }
    
    func redrawView()  {
        self.redrawCalled = true
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context         = UIGraphicsGetCurrentContext()
        let strokeWidth: CGFloat   = 1.0
        
        context!.setLineJoin(CGLineJoin.round)
        context!.setLineWidth(strokeWidth)
        // //print("sdafdfsdf")
        self.height     = rect.height
        self.width      = rect.width
        self.avgX       = self.width / 500
        self.avgY       = self.height / 470
        
        var pointRect: CGRect = CGRect.zero
        var circleString: String = ""
        let fieldFont = UIFont.fontAwesome(ofSize: 18)
        for playByPlay in self.playByPlayArray {
            
            guard let locX = playByPlay.locx, let locY = playByPlay.locy else{
                return
            }
            (pointRect, circleString) = ShotChartControlView.getRectForShotchart(courtx: locX, courty: locY, playByPlay: playByPlay)
            circleString.draw(in: pointRect, withAttributes: [
                NSAttributedStringKey.font: fieldFont,
                NSAttributedStringKey.foregroundColor: self.teamColor])
            if let dlg =  self.delegate {
                dlg.addTargetInRec(pointRect: pointRect, playByPlay: playByPlay)
            }
        }
    }
    deinit {
        
    }
    
    class func getRectForShotchart (courtx: Double , courty: Double, playByPlay: PlayByPlay) -> (CGRect, String) {
       
         let fieldFont = UIFont.fontAwesome(ofSize: 18)
        var circleString: String = String.fontAwesomeIcon(name: .circle)
        
        if let etype = playByPlay.etype, etype == 1 {
            circleString = String.fontAwesomeIcon(name: .circle)
        }else {
            circleString = String.fontAwesomeIcon(name: .circleO)
        }
        let size = fieldFont.sizeOfString(string: circleString, constrainedToWidth: 50)
        
        //        size = CGSize(width: 25, height: 25)
        let point = CGPoint(x: (CGFloat(courtx)), y: CGFloat(courty))
        let pointRect = CGRect(x: CGFloat(point.x), y: CGFloat(point.y), width: size.width, height: size.height)
        return (pointRect ,circleString)
    }
}


