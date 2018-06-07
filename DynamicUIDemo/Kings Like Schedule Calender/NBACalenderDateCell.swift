//
//  NBACalenderDateCell.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 29/05/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import Foundation

var TEXTHEIGHTWIDTH: CGFloat = UIScreen.main.bounds.width > 320 ? 20: 15

class NBACalenderDateCell: UICollectionViewCell {
    
    lazy var textField: UITextField = {
        let text                        = UITextField()
        text.textColor                  = UIColor.white
        text.textAlignment              = .center
        text.layer.cornerRadius         = TEXTHEIGHTWIDTH / 2
        text.isUserInteractionEnabled   = false
        text.frame                      = CGRect(origin: CGPoint.zero, size: CGSize(width: TEXTHEIGHTWIDTH, height: TEXTHEIGHTWIDTH))
        self.addSubview(text)
        return text
    }()
    
    var cellDate: Date? {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var dateSelectmodel: Any?
    var labelDay: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.hexStringToUIColor(hex: "cccdce")
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let dateFont        = UIFont.systemFont(ofSize: 12)
        let winLooseFont    = UIFont.systemFont(ofSize: 9)
        let teamFont        = UIFont.systemFont(ofSize: 15)
        self.textField.isHidden = true
        var textColor = KEYCOLOR
        if let date = self.cellDate {
            //textColor = UIColor.white
            let datefomatter = DateFormatter()
            datefomatter.timeZone = TimeZone.current
            datefomatter.dateFormat = "d"
            let datestring = datefomatter.string(from: date)
            var fillColor = UIColor.RGBAColor(65, green: 135, blue: 197, alpha: 1)
             let size = dateFont.sizeOfString(string: datestring, constrainedToWidth: Double(rect.width))
            var dateFrame = CGRect(origin: CGPoint(x: rect.width - size.width - 2, y: 1), size: size)
            if Calendar.autoupdatingCurrent.isDateInToday(date) {
                self.setCurrentDate(datestring, font: dateFont, fillColor: fillColor)
            }else {
                datestring.draw(in: dateFrame, withAttributes: [
                    NSAttributedStringKey.font: dateFont,
                    NSAttributedStringKey.foregroundColor: textColor])
            }
        }
        
    }
    
    func setCurrentDate(_ string: String, font: UIFont, fillColor: UIColor) {
        self.textField.isHidden = false
        self.textField.backgroundColor = fillColor
        self.textField.font = font
        self.textField.text = string
        self.textField.frame = CGRect(origin: CGPoint(x: (self.frame.width - self.textField.frame.width) / 2, y: (self.frame.height - self.textField.frame.height) / 2), size: self.textField.frame.size)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.labelDay.text = nil
    }
}
