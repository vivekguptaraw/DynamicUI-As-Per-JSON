//
//  CustomGeneratedView.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 26/04/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class CustomGeneratedView: UIView {

    var viewData: [ControlCreateModel] = []
    var recentInsertedView = UIView()
    var contentSize = CGSize.zero
    var isCarousel: Bool = false
    var carouselDataSource: [String]?
    var padding: CGFloat = 0
    var observer: Any?
    init(modelDataArray: [ControlCreateModel], cellSize: CGSize, observer: Any) {
        super.init(frame: CGRect.zero)
        self.viewData = modelDataArray
        self.contentSize = cellSize
        self.createActualViews()
        self.observer = observer
    }
    
    func createActualViews(){
        self.frame.size = self.contentSize
        for model in self.viewData{
            print(model)
            
            self.addChildElements(model: model, parentView: self)
            print(self.frame)
        }
        
    }
    
    func addChildElements(model: ControlCreateModel, parentView: UIView){
        switch model.controlType {
        case .Button:
            if let cnt = model.control{
                if cnt.isKind(of: ButtonControlView.self){
                    let button = cnt as! ButtonControlView
                    if let btn = button.buttonView{
                        btn.alignAndFillWidth(align: .underCentered, relativeTo: recentInsertedView, padding: 0, height: button.height)
                        btn.backgroundColor = UIColor.hexStringToUIColor(hex: button.backgroundColor)
                        parentView.addSubview(btn)
                        recentInsertedView = btn
                        //btn.addTarget(self.observer, action: #selector(DynamicViewController.buttonClicked(_:)), for: .touchUpInside)
                    }
                }
            }
        case .Label:
            if let cnt = model.control{
                if cnt.isKind(of: LabelControlView.self){
                    let control = cnt as! LabelControlView
                    if let lbl = control.labelView{
                        parentView.addSubview(lbl)
                        lbl.sizeToFit()
                        lbl.alignAndFillWidth(align: .underCentered, relativeTo: recentInsertedView, padding: control.padding, height: AutoHeight)
                        let newSize = lbl.sizeThatFits(CGSize(width: lbl.frame.width, height: CGFloat.greatestFiniteMagnitude))
                        let uiViewForlabel = UIView()
                        parentView.addSubview(uiViewForlabel)
                        uiViewForlabel.addSubview(lbl)
                        lbl.sizeToFit()
                        uiViewForlabel.alignAndFillWidth(align: .underCentered, relativeTo: recentInsertedView, padding: 0, height: newSize.height + (2 * control.padding))
                        uiViewForlabel.backgroundColor = UIColor.yellow
                        lbl.fillSuperview(left: control.padding, right: control.padding, top: control.padding, bottom: control.padding)
                        recentInsertedView = uiViewForlabel
                        
                    }
                }
            }
        case .ImageView:
            if let cnt = model.control{
                if cnt.isKind(of: ImageControlView.self){
                    let control = cnt as! ImageControlView
                    if let imgVw = control.imageView{
                        parentView.addSubview(imgVw)
                        imgVw.anchorAndFillEdge(.top, xPad: 0, yPad: 0, otherSize: control.height)
                        recentInsertedView = imgVw
                    }
                }
            }
        case .UIView:
            if let cnt = model.control{
                if cnt.isKind(of: UIViewControlView.self){
                    let control = cnt as! UIViewControlView
                    if let uiVw = control.uiView{
                        parentView.addSubview(uiVw)
                        uiVw.alignAndFillWidth(align: .underCentered, relativeTo: recentInsertedView, padding: 0, height: model.size.height)
                        if control.childControlsArray.count > 0 {
                            self.createChilds(childControlsArray: control.childControlsArray, parentView: uiVw, childAlignment: control.childAlignment, againstEdge: control.childHorizontalRenderingEdge, padding: control.padding, autoSpreadChild: control.autoSpreadChildViews)
                        }
                        if control.layersApplied {
                            uiVw.layer.borderWidth = control.borderWidth
                            uiVw.layer.cornerRadius = control.cornerRadius
                            uiVw.layer.borderColor =  UIColor.hexStringToUIColor(hex: control.borderColor).cgColor
                        }
                        recentInsertedView = uiVw
                    }
                    
                }
            }
        case .Carousel:
            if let cnt = model.control{
                if cnt.isKind(of: CarouselView.self){
                    let control = cnt as! CarouselView
                    if control.urlArray.count > 0{
                        isCarousel = true
                        carouselDataSource = []
                        carouselDataSource = control.urlArray
                    }
                }
            }
        default:
            return
        }
    }
    
    func createChilds(childControlsArray: [NSObject], parentView: UIView, childAlignment: Group,againstEdge: Edge, padding: CGFloat, autoSpreadChild: Bool = true){
        if childControlsArray.count > 0{
            var arrChilds: [UIView] = []
            var sideSpacingGiven = false
            var ht: CGFloat = 0
            var wt: CGFloat = 0
            var widths: [CGFloat] = []
            var heights: [CGFloat] = []
            var edge: Edge = .top
            for ele in childControlsArray{
                if ele.isKind(of: ImageControlView.self){
                    let control = ele as! ImageControlView
                    if let imgVw = control.imageView{
                        parentView.addSubview(imgVw)
                        arrChilds.append(imgVw)
                            ht = control.height
                            wt = control.width
                    }
                }else if ele.isKind(of: ButtonControlView.self){
                    let button = ele as! ButtonControlView
                    if let extendeButton = button.buttonView{
                        arrChilds.append(extendeButton)
                        if extendeButton.titleLabel!.text!.contains("child inside child"){
                            print("inside")
                        }
                        //extendeButton.addTarget(self, action: #selector(DynamicViewController.buttonClicked(_:)), for: .touchUpInside)
                        parentView.addSubview(extendeButton)
                            sideSpacingGiven = true
                            ht = button.height
                            wt = button.width
                    }
                }else if ele.isKind(of: LabelControlView.self){
                    let control = ele as! LabelControlView
                    if let lbl = control.labelView{
                        parentView.addSubview(lbl)
                        arrChilds.append(lbl)
                        ht = control.height
                        wt = control.width - (control.padding * 2)
                    }
                }else if ele.isKind(of: TextFeildControlView.self){
                    let textF = ele as! TextFeildControlView
                        sideSpacingGiven = true
                        ht = textF.height
                        wt = textF.width
                    if let textField = textF.textField{
                        arrChilds.append(textField)
                        parentView.addSubview(textField)
                        textField.keyboardType = .emailAddress
                        textField.returnKeyType = .done
                    }
                } else if ele.isKind(of: UIViewControlView.self){
                    let childView = ele as! UIViewControlView
                        sideSpacingGiven = true
                        ht = childView.height
                        wt = childView.width
                    if let uv = childView.uiView{
                        arrChilds.append(uv)
                        parentView.addSubview(uv)
                        if childView.childControlsArray.count > 0{
                            if !autoSpreadChild{                                
                                parentView.groupAgainstEdge(group: childAlignment, views: arrChilds, againstEdge: againstEdge, padding: padding, width: wt, height: ht)
                            }else{
                                parentView.groupAndFill(group: childAlignment, views: arrChilds, padding: padding)
                            }
                        }
                        if childView.layersApplied {
                            uv.layer.borderWidth = childView.borderWidth
                            uv.layer.cornerRadius = childView.cornerRadius
                            uv.layer.borderColor =  UIColor.hexStringToUIColor(hex: childView.borderColor).cgColor
                            uv.clipsToBounds = true
                        }
                        if childView.childControlsArray.count > 0{
                            self.createChilds(childControlsArray: childView.childControlsArray, parentView: uv, childAlignment: childView.childAlignment, againstEdge: childView.childHorizontalRenderingEdge, padding: childView.padding, autoSpreadChild: childView.autoSpreadChildViews)
                        }
                    }
                    
                }
                widths.append(wt)
                heights.append(ht)
            }
            if !autoSpreadChild{
                if childAlignment == .horizontal {
                    parentView.groupAgainstEdgeWithUnequalHeightWidth(group: childAlignment, views: arrChilds, againstEdge: againstEdge, padding: padding, width: parentView.width, heights: heights, widths: widths, height: parentView.height)
                }else{
                   parentView.groupAgainstEdgeWithUnequalHeightWidth(group: childAlignment, views: arrChilds, againstEdge: .top, padding: padding, width: parentView.width, heights: heights, widths: widths, height: parentView.height)
                }
                
            }else{
                parentView.groupAndFill(group: childAlignment, views: arrChilds, padding: padding)
            }
            
            //
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
