//
//  BubbleArrowView.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 29/05/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import Foundation

class BubbleArrowView: UIView {
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    var arrowPosition: CGFloat = 0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var strockColor: UIColor = UIColor.clear {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var fillColor: UIColor = UIColor.orange {
        didSet {
            self.setNeedsDisplay()
        }
    }
    override func draw(_ rect: CGRect) {
        // Drawing code
        let currentFrame = self.bounds
        let context = UIGraphicsGetCurrentContext()
        let HEIGHTOFPOPUPTRIANGLE: CGFloat   = 10.0
        let WIDTHOFPOPUPTRIANGLE: CGFloat   = 20.0
        
        let strokeWidth: CGFloat   = 0.0
        context!.setLineJoin(CGLineJoin.round)
        context!.setLineWidth(strokeWidth)
        context!.setStrokeColor(self.strockColor.cgColor)
        context!.setFillColor(self.fillColor.cgColor)
        
        // Draw and fill the bubble
        
        context!.beginPath()
        context!.move(to: CGPoint.zero)
        context!.addLine(to: CGPoint(x: currentFrame.size.width, y: 0))
        context!.addLine(to: CGPoint(x: currentFrame.size.width, y: currentFrame.size.height - HEIGHTOFPOPUPTRIANGLE))
        context!.addLine(to: CGPoint(x: self.arrowPosition + WIDTHOFPOPUPTRIANGLE, y: currentFrame.size.height - HEIGHTOFPOPUPTRIANGLE))
        context!.addLine(to: CGPoint(x: self.arrowPosition + WIDTHOFPOPUPTRIANGLE / 2, y: currentFrame.size.height))
        context!.addLine(to: CGPoint(x: self.arrowPosition, y: currentFrame.size.height - HEIGHTOFPOPUPTRIANGLE))
        context!.addLine(to: CGPoint(x: 0, y: currentFrame.size.height - HEIGHTOFPOPUPTRIANGLE))
        context!.closePath()
        context!.drawPath(using: CGPathDrawingMode.fillStroke)
    }
}
