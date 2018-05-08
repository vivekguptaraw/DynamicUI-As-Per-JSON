//
//  DynamicCollectionViewCell.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 19/04/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit



class DynamicCollectionViewCell: UICollectionViewCell {
    var control: UIView?
    var frm: CGRect = CGRect.init(x: 0, y: 0, width: 0, height: 0)
    var topView = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        topView.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
        self.addSubview(topView)
    }
    
    func createControl(model: ControlCreateModel){
        let frm = self.frame
        switch model.controlType {
        case .Button:
            if let cnt = model.control{
                if cnt.isKind(of: ButtonControlView.self){
                    let button = cnt as! ButtonControlView
                    if let btn = button.buttonView{
                        btn.frame = CGRect(origin: CGPoint(x: topView.frame.maxX, y: topView.frame.maxY), size: model.size)
                        self.addSubview(btn)
                    }
                }
            }
        case .Label:
            if let cnt = model.control{
                if cnt.isKind(of: LabelControlView.self){
                    let control = cnt as! LabelControlView
                    if let lbl = control.labelView{
                        self.addSubview(lbl)
                        lbl.sizeToFit()
                        lbl.translatesAutoresizingMaskIntoConstraints = false
                        self.addConstraint(NSLayoutConstraint(item: lbl, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
                        self.addConstraint(NSLayoutConstraint(item: lbl, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0))
                        self.addConstraint(NSLayoutConstraint(item: lbl, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0))
                        self.addConstraint(NSLayoutConstraint(item: lbl, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
//                    lbl.frame.origin =  CGPoint(x: topView.frame.maxX, y: topView.frame.maxY)
//                    self.frame.size = CGSize(width: self.frame.width, height: lbl.frame.height)
//                    lbl.frame.size = self.frame.size
                    }
                }
            }
        case .ImageView:
            if let cnt = model.control{
                if cnt.isKind(of: ImageControlView.self){
                    let control = cnt as! ImageControlView
                    if let imgVw = control.imageView{
                        imgVw.frame =  CGRect(origin: CGPoint(x: topView.frame.maxX, y: topView.frame.maxY), size: model.size)
                        self.addSubview(imgVw)
                    }
                }
            }
        case .UIView:
            if let cnt = model.control{
                if cnt.isKind(of: UIViewControlView.self){
                    let control = cnt as! UIViewControlView
                    if let uiVw = control.uiView{
                        uiVw.frame =  CGRect(origin: CGPoint(x: topView.frame.maxX, y: topView.frame.maxY), size: model.size)
                        self.addSubview(uiVw)
                        if let array = model.childControlsArray{
                            if array.count > 0{
                                    let stkVw = UIStackView()
                                    stkVw.translatesAutoresizingMaskIntoConstraints = false
                                    stkVw.frame = uiVw.frame
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
                            }
                            
                        }
                    }
                }
            }
        default:
            return
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
