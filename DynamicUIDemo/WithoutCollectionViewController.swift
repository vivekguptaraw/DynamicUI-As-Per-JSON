//
//  WithoutCollectionViewController.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 23/04/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class WithoutCollectionViewController: UIViewController {
    var screenDataArray: [ControlCreateModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        DataManager.shared.readDataForWithoutCollection { (array) in
            self.screenDataArray = array
            DispatchQueue.main.async {
                self.createUI()
            }
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    var buttonJSON: [UIControl: String] = [:]
    
    func createUI(){
        var yPos: CGFloat = 0
        for model in self.screenDataArray{
            var x: CGFloat = 0
//            if model.hALign == .Center{
//                x = (UIScreen.main.bounds.size.width - model.size.width) / 2
//            }
            model.origin = CGPoint(x: x, y: yPos)
            yPos += model.size.height
            switch model.controlType {
            case .Button:
                if let cnt = model.control{
                    if cnt.isKind(of: ButtonControlView.self){
                        let button = cnt as! ButtonControlView
                        if let btn = button.buttonView{
                            btn.frame = CGRect(origin: model.origin, size: model.size)
                            btn.backgroundColor = UIColor.hexStringToUIColor(hex: button.backgroundColor)
                            self.view.addSubview(btn)
                            btn.addTarget(self, action: #selector(WithoutCollectionViewController.buttonClicked(_:)), for: .touchUpInside)
                        }
                    }
                }
            case .Label:
                if let cnt = model.control{
                    if cnt.isKind(of: LabelControlView.self){
                        let control = cnt as! LabelControlView
                        if let lbl = control.labelView{
                            self.view.addSubview(lbl)
                            lbl.sizeToFit()
                            lbl.backgroundColor = UIColor.gray
                            lbl.frame = CGRect(origin: model.origin, size: model.size)
                        }
                    }
                }
            case .ImageView:
                if let cnt = model.control{
                    if cnt.isKind(of: ImageControlView.self){
                        let control = cnt as! ImageControlView
                        if let imgVw = control.imageView{
                            imgVw.frame =  CGRect(origin: model.origin, size: model.size)
                            self.view.addSubview(imgVw)
                        }
                    }
                }
            case .UIView:
                if let cnt = model.control{
                    if cnt.isKind(of: UIViewControlView.self){
                        let control = cnt as! UIViewControlView
                        if let uiVw = control.uiView{
                            uiVw.frame =  CGRect(origin: model.origin, size: model.size)
                            self.view.addSubview(uiVw)
                                if control.childControlsArray.count > 0{
                                    let stkVw = UIStackView()
//                                    stkVw.translatesAutoresizingMaskIntoConstraints = false
//                                    stkVw.frame = uiVw.frame
                                    uiVw.addSubview(stkVw)
                                    stkVw.distribution = .fillEqually
                                    stkVw.alignment = .fill
                                    stkVw.spacing = 5
                                    let viewsDictionary = ["stackView":stkVw]
                                    let stackView_H = NSLayoutConstraint.constraints(
                                        withVisualFormat: "H:|-10-[stackView]-10-|",  //horizontal constraint 20 points from left and right side
                                        options: NSLayoutFormatOptions(rawValue: 0),
                                        metrics: nil,
                                        views: viewsDictionary)
                                    let stackView_V = NSLayoutConstraint.constraints(
                                        withVisualFormat: "V:|-30-[stackView]-30-|", //vertical constraint 30 points from top and bottom
                                        options: NSLayoutFormatOptions(rawValue:0),
                                        metrics: nil,
                                        views: viewsDictionary)
                                    uiVw.addConstraints(stackView_H)
                                    uiVw.addConstraints(stackView_V)
                                    var ht: CGFloat = 0
                                    for ele in control.childControlsArray{
                                        if ele.isKind(of: ButtonControlView.self){
                                            let button = ele as! ButtonControlView
                                            if let extendeButton = button.buttonView{
                                                extendeButton.frame.size = button.size
                                                
                                                ht += 5 + button.size.height
                                                stkVw.addArrangedSubview(extendeButton)
                                                extendeButton.addTarget(self, action: #selector(WithoutCollectionViewController.buttonClicked(_:)), for: .touchUpInside)
                                            }
                                        }
                                    }
                                    stkVw.translatesAutoresizingMaskIntoConstraints = true
                                    stkVw.center = CGPoint(x: 20, y: 20)
                                    stkVw.frame.size = CGSize(width: uiVw.frame.size.width, height: ht)
                                    stkVw.backgroundColor = UIColor.gray
                                }
                                
                            }
                        
                    }
                }
            default:
                return
            }
            
        }
    }
    
    @objc func buttonClicked(_ sender: ExtendedButton){
        print(sender.parameter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
