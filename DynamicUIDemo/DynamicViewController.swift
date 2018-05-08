//
//  DynamicViewController.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 24/04/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class DynamicViewController: UIViewController {
    var controlsArray: [ControlCreateModel] = []
    var scrollView = UIScrollView()
    var recentInsertedView = UIView()
    var navBarHt: CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        DataManager.shared.readDataForWithoutCollection { (controlsArray) in
            self.controlsArray = controlsArray
        }
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        if let _nav = self.navigationController{
            navBarHt = _nav.navigationBar.frame.height
        }
        self.scrollView = UIScrollView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - navBarHt)))
        //self.view.backgroundColor = UIColor.yellow
        self.view.addSubview(self.scrollView)
        for model in self.controlsArray{
                print(model)
            self.addChildElements(model: model, parentView: self.scrollView)
            if recentInsertedView.frame.maxY > UIScreen.main.bounds.height{
                self.scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: recentInsertedView.frame.maxY + 20)
            }else{
                //self.scrollView?.user
            }
            mainScrollViewHt = self.scrollView.frame.height
        }
    }
    var mainScrollViewHt: CGFloat = 0
    
    func addChildElements(model: ControlCreateModel, parentView: UIView){
        switch model.controlType {
        case .Button:
            if let cnt = model.control{
                if cnt.isKind(of: ButtonControlView.self){
                    let button = cnt as! ButtonControlView
                    if let btn = button.buttonView{
                        btn.alignAndFillWidth(align: .underCentered, relativeTo: recentInsertedView, padding: 20, height: button.height)
                        btn.backgroundColor = UIColor.hexStringToUIColor(hex: button.backgroundColor)
                        parentView.addSubview(btn)
                        recentInsertedView = btn
                        btn.addTarget(self, action: #selector(DynamicViewController.buttonClicked(_:)), for: .touchUpInside)
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
                            self.createChilds(childControlsArray: control.childControlsArray, parentView: uiVw, childAlignment: control.childAlignment, padding: control.padding, autoSpreadChild: control.autoSpreadChildViews)
                        }
                        
                        recentInsertedView = uiVw
                    }
                    
                }
            }
        default:
            return
        }
    }
    
    func createChilds(childControlsArray: [NSObject], parentView: UIView, childAlignment: Group, padding: CGFloat, autoSpreadChild: Bool = true){
        if childControlsArray.count > 0{
            var arrChilds: [UIView] = []
            var sideSpacingGiven = false
            var ht: CGFloat = 0
            var wt: CGFloat = 0
            var widths: [CGFloat] = []
            for ele in childControlsArray{
                if ele.isKind(of: ImageControlView.self){
                    let control = ele as! ImageControlView
                    if let imgVw = control.imageView{
                        parentView.addSubview(imgVw)
                        arrChilds.append(imgVw)
                        //imgVw.anchorAndFillEdge(.top, xPad: 0, yPad: 0, otherSize: control.height)
                        //recentInsertedView = imgVw
                    }
                }else if ele.isKind(of: ButtonControlView.self){
                    let button = ele as! ButtonControlView
                    if let extendeButton = button.buttonView{
                        arrChilds.append(extendeButton)
                        if extendeButton.titleLabel!.text!.contains("child inside child"){
                            print("inside")
                        }
                        extendeButton.addTarget(self, action: #selector(DynamicViewController.buttonClicked(_:)), for: .touchUpInside)
                        parentView.addSubview(extendeButton)
                        if !autoSpreadChild{
                            sideSpacingGiven = true
                            ht = button.height
                            wt = button.width
                            widths.append(wt)
                            
                        }
                    }
                }else if ele.isKind(of: TextFeildControlView.self){
                    let textF = ele as! TextFeildControlView
                    if textF.sideSpacing > 0{
                        sideSpacingGiven = true
                        ht = textF.height
                        wt = textF.width
                        widths.append(wt)
                        //parentView.frame.size = CGSize(width: parentView.frame.size.width - (textF.sideSpacing / 2), height: parentView.frame.size.height)
                    }
                    if let textField = textF.textField{
                        arrChilds.append(textField)
                        parentView.addSubview(textField)
                        textField.keyboardType = .emailAddress
                        textField.returnKeyType = .done
                        textField.addTarget(self, action: #selector(DynamicViewController.editingDidEnd), for: .editingDidEnd)
                        textField.addTarget(self, action: #selector(DynamicViewController.editingDidEnd), for: .editingDidEndOnExit)
                    }
                } else if ele.isKind(of: UIViewControlView.self){
                    let childView = ele as! UIViewControlView
                    if !childView.autoSpreadChildViews{
                        sideSpacingGiven = true
                        ht = childView.height
                        wt = childView.width
                        widths.append(wt)
                    }
                    if let uv = childView.uiView{
                        arrChilds.append(uv)
                        parentView.addSubview(uv)
                        if childView.childControlsArray.count > 0{
                            if !autoSpreadChild{
                                
                                parentView.groupAgainstEdge(group: childAlignment, views: arrChilds, againstEdge: .left, padding: padding, width: wt, height: ht)
                            }else{
                                parentView.groupAndFill(group: childAlignment, views: arrChilds, padding: padding)
                            }
                        }
                        if childView.childControlsArray.count > 0{
                            //uv.frame.size = CGSize(width: childView.width - childView.sideSpacing, height: childView.height)
                            self.createChilds(childControlsArray: childView.childControlsArray, parentView: uv, childAlignment: childView.childAlignment, padding: childView.padding, autoSpreadChild: childView.autoSpreadChildViews)
                            //uiVw.addSubview(textField)
                        }
                    }
                    
                }
            }
            if !autoSpreadChild{
                parentView.groupAgainstEdge(group: childAlignment, views: arrChilds, againstEdge: .left, padding: padding, width: wt,widths: widths, height: ht)
            }else{
                parentView.groupAndFill(group: childAlignment, views: arrChilds, padding: padding)
            }
            
            //
        }
    }
    
    @objc func editingDidEnd(_sender: UITextField){
        print(_sender.text)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo!
        let keyboardHeight =  (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        print(keyboardHeight)
        self.scrollView.frame.size = CGSize(width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height - keyboardHeight.height)
        
        func getSubview(parentView: UIView){
            _ =  parentView.subviews.map{view in
                if view.isKind(of: UITextField.self){
                    let txt = view as! UITextField
                    
                }
                if view.subviews.count > 0 {
                    getSubview(parentView: view)
                }
                
            }
        }
        getSubview(parentView: self.scrollView)
        
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        //mainScrollViewBottomConstraint.constant = 0
        self.scrollView.frame.size = CGSize(width: self.scrollView.frame.size.width, height: self.mainScrollViewHt)
    }
    
    @objc func buttonClicked(_ sender: ExtendedButton){
        print(sender.parameter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
