//
//  ControlCreateModel.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 19/04/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import Foundation
import UIKit

enum ControlType{
    case ImageView
    case UIView
    case TextField
    case Label
    case TextView
    case UIControl
    case Button
    case Carousel
}

enum TextAlignment{
    case Left
    case Center
    case Right
}

enum VerticalPosition{
    case Top
    case Middle
    case Bottom
}
enum HorizontalPosition{
    case Left
    case Center
    case Right
}




class ControlCreateModel{    
    
    var controlType: ControlType = .UIControl
    var control: NSObject?
    var size: CGSize = CGSize.zero
    var origin: CGPoint = CGPoint.zero
    var portionCoveredPerc: Int?
    var sideSpacing: CGFloat = 0
    var childControlsArray: [NSObject]?
    var childHorizontalRendering: Edge = .left
    var childAlignment: Group = .horizontal
    var maxHeight: CGFloat = 0
    var padding: CGFloat = 0
    
    init(jsonDict: [String: Any], parentSize: CGSize = UIScreen.main.bounds.size, alignment: Group? = .vertical, autoSpreadChild: Bool? = nil) {
        if let key = jsonDict["type"] as? String{
            switch key {
                case "imageview":
                    let imgVw = ImageControlView(data: jsonDict , parentSize: parentSize, alignment: alignment)
                    controlType = .ImageView
                    control = imgVw
                    size.height = imgVw.height
                    size.width = imgVw.width
                    if let p = imgVw.portionCoveredPerc{
                        portionCoveredPerc = p
                    }
                    sideSpacing = imgVw.sideSpacing
                case "label":
                    let lblVw = LabelControlView(data: jsonDict, parentSize: parentSize, alignment: alignment)
                    controlType = .Label
                    control = lblVw
                    size.height = lblVw.height
                    size.width = lblVw.width
                    if let p = lblVw.portionCoveredPerc{
                        portionCoveredPerc = p
                    }
                    sideSpacing = lblVw.sideSpacing
                case "button":
                    let btnVw = ButtonControlView(data: jsonDict, parentSize: parentSize, alignment: alignment, autoSpreadChild: autoSpreadChild)
                    controlType = .Button
                    control = btnVw
                    size.height = btnVw.height
                    size.width = btnVw.width
                    if let p = btnVw.portionCoveredPerc{
                        portionCoveredPerc = p
                    }
                    sideSpacing = btnVw.sideSpacing
            case "textfield":
                    let txtVw = TextFeildControlView(data: jsonDict, parentSize: parentSize, alignment: alignment)
                    controlType = .TextField
                    control = txtVw
                    size.height = txtVw.height
                    size.width = txtVw.width
                    if let p = txtVw.portionCoveredPerc{
                        portionCoveredPerc = p
                    }
                    sideSpacing = txtVw.sideSpacing
            case "uiview":
                    let uiVw = UIViewControlView(data: jsonDict, parentSize: parentSize, alignment: alignment)
                    controlType = .UIView
                    control = uiVw
                    size.height = uiVw.height
                    size.width = uiVw.width
                    if uiVw.maxHeight > 0{
                        size.height = uiVw.maxHeight
                    }
                    if let p = uiVw.portionCoveredPerc{
                        portionCoveredPerc = p
                    }
                    if uiVw.childControlsArray.count > 0{
                        self.childControlsArray = []
                        self.childControlsArray = uiVw.childControlsArray
                    }
                    sideSpacing = uiVw.sideSpacing
                    padding = uiVw.padding
                    childHorizontalRendering = uiVw.childHorizontalRenderingEdge
            case "carousel":
                if let value = jsonDict["childrens"] as? [String: Any]{
                    if let arrayData = value["horizontal"]as? [[String: Any]]{
                        var size = CGSize(width: parentSize.width, height: parentSize.height)
                        let carousel = CarouselView(data: arrayData, parentSize: size)
                        if let p = jsonDict["portionCoveredPerc"] as? Int{
                            portionCoveredPerc = p
                            let size = p.getSizeFromPercent(parentSize: size, alignment: .vertical)
                            self.size.height = size.height
                            self.size.width = size.width
                        }
                        controlType = .Carousel
                        control = carousel
                    }
                    
                }
            default: return
                
            }
        }
    }
}

class UIViewControlView: NSObject{
    
    var uiView: UIView?
    var height: CGFloat = 0
    var width: CGFloat = 0
    var sideSpacing: CGFloat = 0
    var positionInParent: Int = 0
    var padding: CGFloat = 0
    var portionCoveredPerc: Int?
    var childControlsArray: [NSObject] = []
    var childAlignment: Group = .horizontal
    var autoSpreadChildViews: Bool = true
    var layersApplied: Bool = false
    var borderWidth: CGFloat = 0
    var borderColor: String = "ffffff"
    var cornerRadius: CGFloat = 0
    var childHorizontalRenderingEdge: Edge = .left
    var maxHeight: CGFloat = 0
    
    init(data: [String: Any], parentSize: CGSize? = nil, alignment: Group? = nil) {
        let uv = UIView()
        if let bgcolor = data["backgroundColor"] as? String{
            uv.backgroundColor = UIColor.hexStringToUIColor(hex: bgcolor)
        }
        if let ht = data["height"] as? Int{
            height = CGFloat(ht)
        }
        if let wt = data["width"] as? Int{
            width = CGFloat(wt)
        }
        if let ss = data["sideSpacing"] as? Int{
            self.sideSpacing = CGFloat(ss)
        }
        if let pp = data["padding"] as? Int{
            self.padding = CGFloat(pp)
        }
        if let tag = data["tag"] as? String{
            print(tag)
        }
        if let chr = data["childhorizontalrendering"] as? String{
            switch chr{
                case "left" :
                     self.childHorizontalRenderingEdge = .left
                case "center" :
                    self.childHorizontalRenderingEdge = .top
                case "right" :
                    self.childHorizontalRenderingEdge = .right
                default :
                    self.childHorizontalRenderingEdge = .left
            }
        }
        if let p = data["portionCoveredPerc"] as? Int{
            portionCoveredPerc = p
            if let pSize = parentSize{
                if let a = alignment{
                    let size = p.getSizeFromPercent(parentSize: pSize, alignment: a)
                    self.height = size.height
                    self.width = size.width
                }else{
                    height = pSize.height * CGFloat(p) / 100
                    width = pSize.width
                }

            }
        }
        if let l = data["layersapplied"] as? [String: Any]{
            self.layersApplied =  true
            if let layers = l["layerprops"] as? [String: Any]{
                if let borderwidth = layers["borderwidth"] as? Int{
                    self.borderWidth = CGFloat(borderwidth)
                    width -= self.borderWidth * 2
                    height -= self.borderWidth * 2
                }
                if let bordercolor = layers["bordercolor"] as? String{
                    self.borderColor = bordercolor
                }
                if let cornerradius = layers["cornerradius"] as? Int{
                    self.cornerRadius = CGFloat(cornerradius)
                }
            }
        }
        if let autoChild = data["autoSpreadChild"] as? Bool{
            autoSpreadChildViews = autoChild
        }
        
        
        if let childs = data["childrens"] as? [String: Any]{
            for (key, value) in childs{
                if key == "vertical"{
                    childAlignment = .vertical
                    if let val = value as? [[String: Any]]{
                        let sorted = val.sorted(by: { (v1, v2) -> Bool in
                            let num1 = v1["number"] as! Int
                            let num2 = v2["number"] as! Int
                            return num1 < num2
                        })
                        var _calcualtedHeight: CGFloat = 0
                        for ele in sorted{
                            var size = CGSize(width: width, height: height)
                            size.width -= padding * 2
                            size.height -= padding * 2
                            let view = ControlCreateModel(jsonDict: ele,parentSize: size, alignment: .vertical, autoSpreadChild: autoSpreadChildViews)
                            
                            if let v = view.control{
                                if v.isKind(of: UIViewControlView.self){
                                        let cntrl = v as! UIViewControlView
                                            childControlsArray.append(cntrl)
                                        _calcualtedHeight += cntrl.height
                                    }else if v.isKind(of: ButtonControlView.self){
                                        let cntrl = v as! ButtonControlView
                                            childControlsArray.append(cntrl)
                                        _calcualtedHeight += cntrl.height
                                    }else if v.isKind(of: TextFeildControlView.self){
                                        let cntrl = v as! TextFeildControlView
                                        childControlsArray.append(cntrl)
                                        _calcualtedHeight += cntrl.height
                                    }else if v.isKind(of: ImageControlView.self){
                                        let cntrl = v as! ImageControlView
                                        childControlsArray.append(cntrl)
                                        _calcualtedHeight += cntrl.height
                                }else if v.isKind(of: LabelControlView.self){
                                    let cntrl = v as! LabelControlView
                                        if let lbl = cntrl.labelView{
                                            let uiViewForlabel = UIView()
                                            uiViewForlabel.addSubview(lbl)
                                            
                                            lbl.sizeToFit()
                                            uiViewForlabel.anchorAndFillEdge(.top, xPad: 0, yPad: cntrl.padding, otherSize: size.height + (2 * cntrl.padding))
                                            lbl.fillSuperview(left: cntrl.padding, right: cntrl.padding, top: cntrl.padding, bottom: cntrl.padding)
                                            let newSize = lbl.sizeThatFits(CGSize(width: lbl.frame.width, height: CGFloat.greatestFiniteMagnitude))
                                            lbl.frame.size = CGSize(width: max(newSize.width, lbl.frame.width), height: newSize.height + (2 * cntrl.padding))
                                            uiViewForlabel.frame.size = CGSize(width: uiViewForlabel.frame.width, height: lbl.frame.height + (2 * cntrl.padding))
                                            cntrl.height = uiViewForlabel.frame.height
                                            self.maxHeight = self.height + uiViewForlabel.frame.size.height
                                            _calcualtedHeight += cntrl.height
                                        }
                                    childControlsArray.append(cntrl)
                                }
                            }
                        }
                        self.height = _calcualtedHeight
                    }
                }else if key == "horizontal"{
                    childAlignment = .horizontal
                    if let val = value as? [[String: Any]]{
                        let sorted = val.sorted(by: { (v1, v2) -> Bool in
                            let num1 = v1["number"] as! Int
                            let num2 = v2["number"] as! Int
                            return num1 < num2
                        })
                        for ele in sorted{
                            var size = CGSize(width: width, height: height)
                            size.width -= padding * 2
                            size.height -= padding * 2
                            let view = ControlCreateModel(jsonDict: ele,parentSize: size, alignment: .horizontal, autoSpreadChild: autoSpreadChildViews)
                            if let v = view.control{
                                if v.isKind(of: UIViewControlView.self){
                                    let cntrl = v as! UIViewControlView
                                    childControlsArray.append(cntrl)
                                }else if v.isKind(of: ButtonControlView.self){
                                    let cntrl = v as! ButtonControlView
                                    childControlsArray.append(cntrl)
                                }else if v.isKind(of: TextFeildControlView.self){
                                    let cntrl = v as! TextFeildControlView
                                    childControlsArray.append(cntrl)
                                }else if v.isKind(of: ImageControlView.self){
                                    let cntrl = v as! ImageControlView
                                    childControlsArray.append(cntrl)
                                }else if v.isKind(of: LabelControlView.self){
                                    let cntrl = v as! LabelControlView
                                    if let lbl = cntrl.labelView{
                                        let uiViewForlabel = UIView()
                                        uiViewForlabel.addSubview(lbl)
                                        
                                        lbl.sizeToFit()
                                        cntrl.height = size.height
                                        cntrl.width = size.width - padding * 2
                                    }
                                    childControlsArray.append(cntrl)
                                }
                            }
                        }
                    }
                }
            }
        }
        uiView = uv
    }
}

class CarouselView: NSObject{
    var urlArray: [String] = []
    var size = CGSize.zero
    init(data: [[String: Any]], parentSize: CGSize? = nil) {
        super.init()
        if let p = parentSize {
            size = p
        }
        _ = data.sorted(by: { (v1, v2) -> Bool in
            let num1 = v1["number"] as! Int
            let num2 = v2["number"] as! Int
            return num1 < num2
        }).map{[weak self] obj in
            if let urlStr = obj["url"] as? String{
                guard let slf = self else {return}
                slf.urlArray.append(urlStr)
            }
        }
        
       
    }
}

class ButtonControlView: NSObject{
    
    var buttonView : ExtendedButton?
    var text: String?
    var height: CGFloat = 0
    var width: CGFloat = 0
    var sideSpacing: CGFloat = 0
    var positionInParent: Int = 0
    var portionCoveredPerc: Int?
    var parameter: String = ""
    var backgroundColor: String = ""
    var size: CGSize = CGSize.zero
    var origin: CGPoint = CGPoint.zero
    var childsHALignment: Edge = .left
    var padding: CGFloat = 0
    
    init(data: [String: Any], parentSize: CGSize? = nil, alignment: Group? = nil, autoSpreadChild: Bool? = true) {
        let btn = ExtendedButton()
        if let txt = data["title"] as? String{
            btn.setTitle(txt, for: .normal)
        }
        if let bg = data["backgroundColor"] as? String{
            self.backgroundColor = bg
            btn.backgroundColor = UIColor.hexStringToUIColor(hex: bg)
        }
        if let ht = data["height"] as? Int{
            height = CGFloat(ht)
        }
        if let wt = data["width"] as? Int{
            width = CGFloat(wt)
        }
        if let ss = data["sideSpacing"] as? Int{
            self.sideSpacing = CGFloat(ss)
        }
        size.height = height
        size.width = width
        if let param = data["parameter"] as? [String: Any]{
            if let query = param["query"] as? [String: Any]{
                if let id = query["id"] as? String{
                    parameter = id
                }
                if let deeplink = query["deeplink"] as? String{
                    parameter = "\(parameter)_\(deeplink)"
                }
            }
            btn.parameter = parameter
        }
        if let pp = data["padding"] as? Int{
            self.padding = CGFloat(pp)
        }
        if let auto = autoSpreadChild{
            if !auto{
                if let p = data["portionCoveredPerc"] as? Int{
                    portionCoveredPerc = p
                    if let pSize = parentSize{
                        if let a = alignment{
                            self.size = p.getSizeFromPercent(parentSize: pSize, alignment: a)
                            self.height = size.height
                            self.width = size.width
                        }else{
                            height = pSize.height * CGFloat(p) / 100
                            width = pSize.width
                        }
                        
                    }
                }
            }
        }
        
        buttonView = btn
    }
    
}

class LabelControlView: NSObject{
    
    var labelView: UILabel?
    var text: String?
    var height: CGFloat = 0
    var width: CGFloat = 0
    var sideSpacing: CGFloat = 0
    var positionInParent: Int = 0
    var portionCoveredPerc: Int?
    var padding: CGFloat = 0
    
    init(data: [String: Any], parentSize: CGSize? = nil, alignment: Group? = nil) {
        let lbl = UILabel()
        if let txt = data["text"] as? String{
            lbl.text = txt
        }
        if let txt = data["textalignment"] as? String{
            switch txt{
            case "center":
                lbl.textAlignment = .center
            case "left":
                lbl.textAlignment = .left
            case "right":
                lbl.textAlignment = .right
            default: return
            }
        }
        if let ht = data["height"] as? Int{
            height = CGFloat(ht)
        }
        if let pd = data["padding"] as? Int{
            padding = CGFloat(pd)
        }
        if let wt = data["width"] as? Int{
            width = CGFloat(wt)
        }
        if let ss = data["sideSpacing"] as? Int{
            self.sideSpacing = CGFloat(ss)
        }
        if let p = data["portionCoveredPerc"] as? Int{
            portionCoveredPerc = p
            if let pSize = parentSize{
                if let a = alignment{
                    let size = p.getSizeFromPercent(parentSize: pSize, alignment: a)
                    self.height = size.height
                    self.width = size.width
                }else{
                    height = pSize.height * CGFloat(p) / 100
                    width = pSize.width
                }
                
            }
        }
        if let lines = data["numberOfLines"] as? Int{
            lbl.numberOfLines = lines
            if let pSize = parentSize{
                width = pSize.width - padding
            }
        }
        labelView = lbl
        
    }
}

class TextFeildControlView: NSObject{
    
    var textField: UITextField?
    var text: String?
    var placeHolderText: String = ""
    var placeHolderColor: UIColor = .lightGray
    var height: CGFloat = 0
    var width: CGFloat = 0
    var sideSpacing: CGFloat = 0
    var positionInParent: Int = 0
    var portionCoveredPerc: Int?
    
    init(data: [String: Any], parentSize: CGSize? = nil, alignment: Group? = nil) {
        let field = UITextField()
        if let txt = data["title"] as? String{
            field.text = txt
        }
        if let clr = data["backgroundColor"] as? String{
            field.backgroundColor = UIColor.hexStringToUIColor(hex: clr)
        }
        if let txt = data["textalignment"] as? String{
            switch txt{
            case "center":
                field.textAlignment = .center
            case "left":
                field.textAlignment = .left
            case "right":
                field.textAlignment = .right
            default: return
            }
        }
        if let ht = data["height"] as? Int{
            height = CGFloat(ht)
        }
        if let wt = data["width"] as? Int{
            width = CGFloat(wt)
        }
        if let ss = data["sideSpacing"] as? Int{
            self.sideSpacing = CGFloat(ss)
        }
        if let p = data["portionCoveredPerc"] as? Int{
            portionCoveredPerc = p
            if let pSize = parentSize{
                if let a = alignment{
                    let size = p.getSizeFromPercent(parentSize: pSize, alignment: a)
                    self.height = size.height
                    self.width = size.width
                }else{
                    height = pSize.height * CGFloat(p) / 100
                    width = pSize.width
                }
                
            }
            
        }
        textField = field
    }
}


class ImageControlView: NSObject{
    
    var imageView: UIImageView?
    var image: UIImage?
    var height: CGFloat = 0
    var width: CGFloat = 0
    var sideSpacing: CGFloat = 0
    var positionInParent: Int = 0
    var portionCoveredPerc: Int?
    var url: String?
    var childsHALignment: Edge = .left
    
    init(data: [String: Any], parentSize: CGSize? = nil, alignment: Group? = nil) {
        if let img = data["url"] as? String{
            image = UIImage(named: img)
        }
        let imgVw = UIImageView(image: image)
        if let ht = data["height"] as? Int{
            height = CGFloat(ht)
        }
        if let wt = data["width"] as? Int{
            width = CGFloat(wt)
        }
        if let ss = data["sideSpacing"] as? Int{
            self.sideSpacing = CGFloat(ss)
        }
        if let p = data["portionCoveredPerc"] as? Int{
            portionCoveredPerc = p
            if let pSize = parentSize{
                if let a = alignment{
                    let size = p.getSizeFromPercent(parentSize: pSize, alignment: a)
                    self.height = size.height
                    self.width = size.width
                }else{
                    height = pSize.height * CGFloat(p) / 100
                    width = pSize.width
                }
                
            }
        }
        imageView = imgVw
    }
}



class ExtendedButton: UIButton{
    
    var parameter: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Int{
    func getSizeFromPercent(parentSize: CGSize, alignment: Group) -> CGSize{
        var size = CGSize.zero
        if alignment == .horizontal{
            size.height =  parentSize.height
            size.width = parentSize.width * CGFloat(self) / 100
        }else{
            size.height = parentSize.height * CGFloat(self) / 100
            size.width =  parentSize.width
        }
        return size
    }
}









