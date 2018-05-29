//
//  ShotTrackerHeaderView.swift
//  Kings
//
//  Created by Vivek Gupta on 15/05/18.
//  Copyright © 2018 built.io. All rights reserved.
//

import UIKit
import FontAwesome_swift

extension UIFont{
    func sizeOfString (string: String, constrainedToWidth width: Double) -> CGSize {
        return NSString(string: string).boundingRect(with: CGSize(width: width, height: 9999),
                                                     options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                     attributes: [NSAttributedStringKey.font: self],
                                                     context: nil).size
    }
    
}


var CommonfloatingFrameWidhtHeight = UIScreen.main.bounds.width > 320  ? 33: 25


enum ControlEvents: Int {
    case touchUpInside
    case touchMoved
    case touchBegan
    case touchCancel
}
protocol ShotChartDrawDelegate: class {
    func addTargetInRec(pointRect: CGRect, playByPlay: PlayByPlay)
}

protocol ShotChartCliksDelegate: class {
    func pointsClickedHandler<T, U>(data: T, anotherData: U)
}


class ShotChartData {
    var target: AnyObject
    var action: ((_ rect: CGRect) -> Swift.Void)
    var controlEvents: ControlEvents
    var rect: CGRect
    
    init(target: AnyObject, rect: CGRect, event: ControlEvents, action: @escaping ((_ rect: CGRect) -> Swift.Void)) {
        self.target         = target
        self.rect           = rect
        self.controlEvents  = event
        self.action         = action
    }
}

class NBAShotTrackerHeaderView: UIView {
    @IBOutlet weak var courtImage: UIImageView!
    @IBOutlet weak var shotChtImage: UIImageView!
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var heatMapImage: HeatMapView!
    
    @IBOutlet weak var selectedCircleLabel: UILabel!
    @IBOutlet weak var playByPlayLabel: UILabel!
    @IBOutlet weak var baseView: ShotChartBubbleView!
    @IBOutlet weak var roundCircleImage: UIImageView!
    
    @IBOutlet weak var multiSelectionbaseView: UIView!
    @IBOutlet weak var multiSelectionLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var teamColor: UIColor = UIColor.clear {
        didSet {
            self.heatMapImage.teamColor = self.teamColor
            self.selectedCircleLabel.textColor = self.teamColor
        }
    }
    let flotingLabel = UIImageView(image: UIImage(named: "RoundCircle"))
    
    var touchUpEventHandlers: [ShotChartData]        = [ShotChartData]()
    var dragging: Bool      = false
    var gCode: String    = ""
    var teamID: String    = ""
    weak var delegate: ShotChartCliksDelegate?
    var numberOfQtrSelected: Int = 1 {
        didSet {
            if self.heatMapImage.isHidden {
                if numberOfQtrSelected > 1 {
                    self.baseView.isHidden                  = true
                    self.selectedCircleLabel.isHidden       = true
                    self.playByPlayLabel.isHidden           = true
                    self.roundCircleImage.isHidden          = true
                    self.flotingLabel.isHidden              = true
                }else {
                    self.multiSelectionbaseView.isHidden    = true
                }
            }
        }
    }
    
    var playByPlay: [PlayByPlay] = [] {
        didSet {
            
            self.setHeatMap()
            self.redrawView()
            if let lastPbp = playByPlay.last{
                guard let locX = lastPbp.locx, let locY = lastPbp.locy else{
                    return
                }
                let pbpPoint  = ShotChartControlView.getRectForShotchart(courtx: locX, courty: locY, playByPlay: lastPbp)
                let newPointRect = CGRect(origin: CGPoint(x: pbpPoint.0.minX, y: pbpPoint.0.minY + heightForQuartersView), size: pbpPoint.0.size)
                self.showSelectedPlayByPlay(playByPlay: lastPbp, circleString: pbpPoint.1, rect: newPointRect)
            }
            
        }
    }
    
    private func setHeatMap () {
        var MaxPoint    = CGPoint.zero
        var rect        = [AnyHashable: Any]()
        for playByPlay in self.playByPlay {
            
            var weight: Double = 0.9
            guard let lx = playByPlay.locx, let ly = playByPlay.locy else { return }
            let point: CGPoint = CGPoint(x: lx, y: ly)
            if (MaxPoint.x < point.x){
                MaxPoint = CGPoint(x: point.x, y: MaxPoint.y)
            }
            if (MaxPoint.y < point.y) {
                MaxPoint = CGPoint(x: MaxPoint.x, y: point.y)
            }
            let pointValue: NSValue = NSValue(cgPoint: point)
            if let eTyype = playByPlay.etype{
                if eTyype != 1{
                     weight = 0.09
                }
            }
            
            rect[pointValue] = NSNumber(value: weight)

        }
        self.heatMapImage.teamColor = self.teamColor
        self.heatMapImage.setPointDict(rect)
    }
    
    func redrawView()  {
        
        self.touchUpEventHandlers.removeAll()
        let concurrentQueue = DispatchQueue(label: "PlayByPlayShotChartQueue", attributes: .concurrent)
        concurrentQueue.sync {[weak self] in
            guard let slf = self else {return}
            let rect: CGRect = CGRect(origin: CGPoint(x: 0, y: yMarginForShotTrakerView), size: CGSize(width: slf.frame.width, height: slf.shotChtImage.frame.height))
            UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
            let  context = UIGraphicsGetCurrentContext()
            context!.saveGState()
            context!.setFillColor(UIColor.clear.cgColor)
            context!.fill(rect)
            context!.restoreGState()
            let tst: ShotChartControlView = ShotChartControlView(frame: CGRect(origin: CGPoint(x: 0, y: yMarginForShotTrakerView), size: CGSize(width: slf.frame.width, height: slf.frame.height )), delegate: slf)
            tst.backgroundColor = UIColor.clear
            tst.playByPlayArray = slf.playByPlay
            tst.teamColor = slf.teamColor
            tst.draw(tst.bounds)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            DispatchQueue.main.async {
                slf.shotChtImage.image = image
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.hexStringToUIColor(hex: "e2e2e2")
        let attributes = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 15), NSAttributedStringKey.foregroundColor: UIColor.darkGray]
        let attributesSel = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 15), NSAttributedStringKey.foregroundColor: UIColor.white]
        self.segmentController.setTitleTextAttributes(attributes, for: UIControlState.normal)
        self.segmentController.setTitleTextAttributes(attributesSel, for: UIControlState.selected)
        self.segmentController.setTitle("i", forSegmentAt: 1)
        self.segmentController.setTitle("I", forSegmentAt: 0)
        self.segmentController.addTarget(self, action: #selector(NBAShotTrackerHeaderView.segmentControllerChange), for: UIControlEvents.valueChanged)
        self.segmentController.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2.0))
        self.heatMapImage.isHidden = true
        
        self.selectedCircleLabel.textColor = self.teamColor
        self.multiSelectionLabel.font   = UIFont.boldSystemFont(ofSize: 16)
        self.multiSelectionLabel.text   = "Field goal details only available when a single quarter is selected."
        self.selectedCircleLabel.font   = UIFont.fontAwesome(ofSize: 12)
        self.flotingLabel.frame         = CGRect(origin: CGPoint.zero, size: CGSize(width: CommonfloatingFrameWidhtHeight, height: CommonfloatingFrameWidhtHeight))
        self.baseView.isHidden            = true
        self.selectedCircleLabel.isHidden = true
        self.playByPlayLabel.isHidden     = true
        self.roundCircleImage.isHidden    = true
        self.multiSelectionbaseView.isHidden  = true
        
        for view in self.segmentController.subviews {
            view.accessibilityValue = view.accessibilityLabel
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.redrawView()
        for view in self.segmentController.subviews {
            for subview in view.subviews {
                if subview.isKind(of: UILabel.classForCoder()) {
                    subview.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2.0))
                }
            }
        }
    }
    
    @objc func segmentControllerChange() {
        if self.segmentController.selectedSegmentIndex == 0 {
            self.shotChtImage.isHidden = false
            self.heatMapImage.isHidden = true
        }else {
            self.shotChtImage.isHidden = true
            self.heatMapImage.isHidden = false
            self.baseView.isHidden            = true
            self.selectedCircleLabel.isHidden = true
            self.playByPlayLabel.isHidden     = true
            self.roundCircleImage.isHidden    = true
            self.multiSelectionbaseView.isHidden  = true
            self.flotingLabel.isHidden          = true
        }
        
    }
    
    func showSelectedPlayByPlay(playByPlay: PlayByPlay, circleString: String, rect: CGRect) {
        if self.shotChtImage.isHidden {
            return
        }
        if self.numberOfQtrSelected != 1 {
            self.baseView.isHidden            = true
            self.selectedCircleLabel.isHidden = true
            self.playByPlayLabel.isHidden     = true
            self.roundCircleImage.isHidden    = true
            self.flotingLabel.isHidden        = true
            
            if self.numberOfQtrSelected > 1 {
                if self.multiSelectionbaseView.isHidden {
                    self.multiSelectionbaseView.isHidden  = false
                }else {
                    self.multiSelectionbaseView.isHidden  = true
                }
            }
        }else {
            self.multiSelectionbaseView.isHidden  = true
            
            self.baseView.isHidden            = false
            self.selectedCircleLabel.isHidden = false
            self.playByPlayLabel.isHidden     = false
            self.roundCircleImage.isHidden    = false
            self.flotingLabel.isHidden        = false
            self.playByPlayLabel.text       = playByPlay.desc
            self.playByPlayLabel.accessibilityValue = playByPlay.desc
            self.selectedCircleLabel.text   = circleString
            self.selectedCircleLabel.accessibilityValue   = circleString
            self.flotingLabel.center        = CGPoint(x: ((rect.minX + rect.width / 2)), y: ((rect.minY + rect.height / 2)))
            self.addSubview(self.flotingLabel)
        }
    }
}

extension NBAShotTrackerHeaderView: ShotChartDrawDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dragging = false
        if !handle(touches, with: event, controlEvents: ControlEvents.touchBegan) {
            super.touchesBegan(touches, with: event)
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dragging = false
        if !handle(touches, with: event, controlEvents: ControlEvents.touchUpInside) {
            super.touchesEnded(touches, with: event)
        }
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dragging = false
        if !handle(touches, with: event, controlEvents: ControlEvents.touchCancel) {
            super.touchesCancelled(touches, with: event)
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dragging = true
        if !handle(touches, with: event, controlEvents: ControlEvents.touchMoved) {
            super.touchesMoved(touches, with: event)
        }
    }
    func addTargetInRec(pointRect: CGRect, playByPlay: PlayByPlay) {
        let newPointRect = CGRect(origin: CGPoint(x: pointRect.minX, y: pointRect.minY + heightForQuartersView), size: pointRect.size)
        let shotData = ShotChartData(target: self, rect: newPointRect, event: ControlEvents.touchUpInside) {[weak self] (rect: CGRect) in
            guard let slf = self else {return}
            var circleString: String = String.fontAwesomeIcon(name: .circle)
            if let etype = playByPlay.etype{
                if etype == 1{
                    circleString = String.fontAwesomeIcon(name: .circle)
                }else{
                    circleString = String.fontAwesomeIcon(name: .circleO)
                }
            }
            slf.delegate?.pointsClickedHandler(data: playByPlay, anotherData: circleString)
            slf.showSelectedPlayByPlay(playByPlay: playByPlay, circleString: circleString, rect: newPointRect)
        }
        self.touchUpEventHandlers.append(shotData)
    }
    
    private func handle(_ touches: Set<UITouch>, with event: UIEvent?, controlEvents: ControlEvents) -> Bool{
        if let touch = touches.first {
            let location = touch.location(in: self)
            for shotData in self.touchUpEventHandlers {
                if shotData.rect.contains(location) && shotData.controlEvents == controlEvents {
                    shotData.action(shotData.rect)
                    return true
                }
            }
        }
        return false
    }
}

class ShotChartBubbleView: UIView {
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        let currentFrame = self.bounds
        let context = UIGraphicsGetCurrentContext()
        let strokeWidth: CGFloat   = 1.0
        
        context!.setLineJoin(CGLineJoin.round)
        context!.setLineWidth(strokeWidth)
        context!.setStrokeColor(UIColor.RGBAColor(231, green: 232, blue: 234, alpha: 1).cgColor)
        context!.setFillColor(UIColor(white: 1, alpha: 0.7).cgColor)
        
        // Draw and fill the bubble
        
        context!.beginPath()
        context!.move(to: CGPoint(x: 0, y: currentFrame.size.height / 2))
        context!.addLine(to: CGPoint(x: 20, y: 0))
        context!.addLine(to: CGPoint(x: currentFrame.size.width, y: 0))
        context!.addLine(to: CGPoint(x: currentFrame.size.width, y: currentFrame.size.height))
        context!.addLine(to: CGPoint(x: 20, y: currentFrame.size.height))
        context!.move(to: CGPoint(x: 0, y: currentFrame.size.height / 2))
        
        context!.closePath()
        context!.drawPath(using: CGPathDrawingMode.fillStroke)
    }
    
}


