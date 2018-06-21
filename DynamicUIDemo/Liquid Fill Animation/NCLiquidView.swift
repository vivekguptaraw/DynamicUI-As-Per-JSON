//
//  NCLiquidView.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 20/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

protocol NCLiquidViewDelegate{
    func finished()
}

class NCLiquidView: UIView {
    var steps: Int = 200
    var count: Int = 40
    var timer: Timer!
    var yInterval: CGFloat = 0
    var path: UIBezierPath!
    var shapeLayer: CAShapeLayer!
    var animation: CABasicAnimation!
    var fillAll: Bool = false{
        didSet{
            if fillAll{
                self.countDownTimer = self.countDownTimer / 5
                self.timer = Timer.scheduledTimer(timeInterval: self.countDownTimer, target: self, selector: #selector(NCLiquidView.createLayer), userInfo: nil, repeats: false)
            }            
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        leftTopSeek = frame.height
        setTimer()
    }
    var countDownTimer: Double = 0.1
    func setTimer(){
        if timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: countDownTimer, target: self, selector: #selector(NCLiquidView.createLayer), userInfo: nil, repeats: false)
           
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let circleshapeLayer = CAShapeLayer()
        circleshapeLayer.path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width/2 - self.frame.size.height/2,
                                                      y: 0.0,
                                                      width: self.frame.size.height,
                                                      height: self.frame.size.height)).cgPath
        self.layer.mask = circleshapeLayer
    }
    
    @objc func createLayer(){
        if self.timer == nil{
            print("timer is nil ..returned")
            return
        }
        shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.red.cgColor
        //shapeLayer.path = self.createSine(_steps: self.steps, yInterval: self.yInterval).cgPath
        
        self.layer.addSublayer(shapeLayer)
        animation = CABasicAnimation(keyPath: "path")
        let lower : UInt32 = 0
        let upper : UInt32 = UInt32(10)
        let randomNumber = arc4random_uniform(upper - lower) + lower
        animation.fromValue = self.createSine(_steps: 60, heightOfWave: Double(randomNumber)).cgPath
        
        let lowerNext : UInt32 = 0
        let upperNext : UInt32 = UInt32(25)
        let randomNumberNext = arc4random_uniform(upperNext - lowerNext) + lower
        if self.fillAll{
            print("fill all set \(self.leftTopSeek) \(self.yInterval)")
            self.leftTopSeek = -150
            if self.timer != nil{
                self.timer.invalidate()
                self.timer = nil
                print("fill all set")

            }
            animation.toValue = self.createSineEnd(_steps: 40, heightOfWave: Double(8)).cgPath
        }else{
            animation.toValue = self.createSine(_steps: self.steps, yInterval: self.yInterval, heightOfWave: Double(randomNumberNext)).cgPath
        }
        
        
        animation.fillMode = kCAFillModeForwards
        animation.duration = self.fillAll ? 0.5 : 3
        animation.isRemovedOnCompletion = false
        shapeLayer.add(animation, forKey: animation.keyPath)
        self.steps = 100
        if self.count % 6 == 0{
            self.steps += 20
        }else if self.count % 2 == 0{
            self.steps -= 40
        }else if self.count % 3 == 0{
            self.steps += 70
        }else if self.count % 5 == 0{
            self.steps += 60
        }else{
            self.steps -= 20
        }
        self.count -= 1
        self.yInterval += 2
        
        if self.yInterval > self.frame.height / 1.5 {
            if self.timer != nil{
                self.timer.invalidate()
                self.timer = nil
                print("timer is nil first if loop")
            }
        }else{
            if self.timer != nil{
                print("timer is not nil next else")
                self.timer = Timer.scheduledTimer(timeInterval: countDownTimer, target: self, selector: #selector(NCLiquidView.createLayer), userInfo: nil, repeats: false)
            }
        }
    }
    var leftTopSeek: CGFloat = 0
    var percentFilled: Int = 0
    func createSine(_steps: Int, yInterval: CGFloat, heightOfWave: Double) -> UIBezierPath{
        let centerY = frame.height / 2
        let steps = _steps
        let stepX = frame.width / CGFloat(steps)
        self.path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: frame.height))
        path.addLine(to: CGPoint(x: 0, y: leftTopSeek - 30 - yInterval))
        for i in 0...steps {
            let x = CGFloat(i) * stepX
            let y = (sin(Double(i) * 0.1) * heightOfWave) + Double(leftTopSeek - 30 - yInterval) - Double(yInterval)
            path.addLine(to: CGPoint(x: x, y: CGFloat(y)))
            
        }
        path.addLine(to: CGPoint(x: frame.width + 100, y: frame.height))
        path.close()
        return path
    }
    
    func createSine(_steps: Int, heightOfWave: Double)  -> UIBezierPath {
        let centerY = frame.height / 2
        let steps = _steps
        let stepX = frame.width / CGFloat(steps)
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: frame.height))
        path.addLine(to: CGPoint(x: 0, y: frame.height - 1))
        for i in 0...steps {
            let x = CGFloat(i) * stepX
            let y = (sin(Double(i) * 0.1) * heightOfWave) + Double(frame.height)
            path.addLine(to: CGPoint(x: x, y: CGFloat(y)))
            
        }
        path.addLine(to: CGPoint(x: frame.width + 100, y: frame.height))
        path.close()
        return path
    }
    
    func createSineEnd(_steps: Int, heightOfWave: Double)  -> UIBezierPath {
        let centerY = frame.height / 2
        let steps = _steps
        let stepX = frame.width / CGFloat(steps)
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.leftTopSeek))
        for i in 0...steps {
            let x = CGFloat(i) * stepX
            let y = (sin(Double(i) * 0.5) * heightOfWave) + Double(-20)
            path.addLine(to: CGPoint(x: x, y: CGFloat(y)))
            
        }
        path.addLine(to: CGPoint(x: frame.width + 450, y: frame.height))
        path.close()
        return path
    }
    
    func animateSineWave(){
        
    }

}
