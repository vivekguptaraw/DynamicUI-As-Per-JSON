//
//  UIImageView+Extension.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 18/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import Foundation

var operations: UInt8 = 0
var loadUrlString: UInt8 = 0

protocol DownloadImage: class {}


extension DownloadImage where Self: UIImageView {
    var loadingString: String? {
        set {
            objc_setAssociatedObject(self, &loadUrlString, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &loadUrlString) as? String
        }
    }
    
    func loadImage(urlString: String?, shouldReload: Bool = false, completion: ((_ image: UIImage?) -> Swift.Void)? = nil)  {
        if urlString != nil {
            if urlString?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).count == 0 {
                return
            }
            self.loadingString = urlString!.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: " ").inverted)!
            _ = NCImageLoadManager.shared.downloadImage(withUrl: self.loadingString!, shouldStore: !shouldReload) {[weak self] (url, image) in
                DispatchQueue.main.async {
                    if let slf = self, let img = image {
                        if slf.loadingString == url {
                            slf.image = img
                            if let cmp = completion{
                                cmp(image)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func loadImage(usingNSCache urlString: String?, shouldReload: Bool = false, completion: ((_ image: UIImage?) -> Swift.Void)? = nil, updateWithChange: ((_ url: String, _ image: UIImage?) -> Swift.Void)? = nil){
        if urlString != nil {
            if urlString?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).count == 0 {
                return
            }
            self.loadingString = urlString!.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: " ").inverted)!
            _ = NCImageLoadManager.shared.downloadImage(usingNSCache: self.loadingString!, shouldStore: !shouldReload, completion: {[weak self](urlString, image) in
                DispatchQueue.main.async {
                    if let slf = self, let img = image {
                        if slf.loadingString == urlString {
                            slf.image = img
                            if let cmp = completion{
                                cmp(image)
                            }
                        }
                    }
                }
            }, updateWithChange: {[weak self](urlString, image) in
                DispatchQueue.main.async {
                    if let slf = self, let img = image {
                        if slf.loadingString == urlString {
                            slf.image = img
                            if let cmp = completion{
                                cmp(image)
                            }
                        }
                    }
                }
            })
           
        }
    }
    
    func loadOrUpadateImage(with urlString: String?, shouldReload: Bool = false, completion: ((_ image: UIImage?) -> Swift.Void)? = nil, updateWithChange: ((_ url: String, _ image: UIImage?) -> Swift.Void)? = nil){
        if urlString != nil {
            if urlString?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).count == 0 {
                return
            }
            self.loadingString = urlString!.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: " ").inverted)!
            print("downloadImageOrUpdateImage called...")
            _ = NCImageLoadManager.shared.downloadImageOrUpdateImage(withUrl: self.loadingString!, shouldStore: !shouldReload, completion: {[weak self](urlString, image) in
                DispatchQueue.main.async {
                    if let slf = self, let img = image {
                        if slf.loadingString == urlString {
                            print("downloadImageOrUpdateImage completion...")
                            slf.image = img
                            if let cmp = completion{
                                cmp(image)
                            }
                        }
                    }
                }
                }, updateWithChange: {[weak self](urlString, image) in
                    DispatchQueue.main.async {
                        if let slf = self, let img = image {
                            if slf.loadingString == urlString {
                                print("downloadImageOrUpdateImage updateWithChange...")
                                slf.image = img
                                if let cmp = completion{
                                    cmp(image)
                                }
                            }
                        }
                    }
            })
            
        }
    }
    
    private func cancelOperation (_ url: String)  {
        var operationDict = self.getOperationDict()
        if let operation: Operation = operationDict[url] as? Operation {
            operation.cancel()
            operationDict[url] = nil
        }
        objc_setAssociatedObject(self, &operations, operationDict, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    private func setOperation (_ operation: Operation, for key: String) {
        var operationDict = self.getOperationDict()
        operationDict[key] = operation
        objc_setAssociatedObject(self, &operations, operationDict, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    private func getOperationDict () -> [AnyHashable: Operation?] {
        if let operationDictionary = objc_getAssociatedObject(self, &operations) as? [AnyHashable: Operation] {
            return operationDictionary
        }else {
            let operationDictionary = [AnyHashable: Operation?]()
            objc_setAssociatedObject(self, &operations, operationDictionary, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return operationDictionary
        }
    }
}

extension UIImageView: DownloadImage {
    
}


