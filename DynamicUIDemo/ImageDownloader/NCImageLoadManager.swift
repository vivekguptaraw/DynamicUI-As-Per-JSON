//
//  NCImageLoadManager.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 18/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import Foundation


class NCImageLoadManager: Any {
    static var shared = NCImageLoadManager()
    private var requestOperations: OperationQueue
    
    init() {
        
        self.requestOperations = OperationQueue()
        self.requestOperations.maxConcurrentOperationCount = 6
        self.requestOperations.name = "com.nc.ImageDownload"
    }
    
    func downloadImage(withUrl url: String, shouldStore: Bool, completion: @escaping ((_ url: String, _ hashable: UIImage?) -> Swift.Void)) -> Operation? {
        
        if FileManager.default.fileExists(atPath: NCImageDownloadOperation.pathForDictionary.appendingPathComponent(url.md5).path) {
            if let responseData = FileManager.default.contents(atPath: NCImageDownloadOperation.pathForDictionary.appendingPathComponent(url.md5).path) {
                //The file exists but check if actual data is changed
                
                completion(url, responseData.animatedImageFromData())
            }else {
                completion(url, nil)
            }
            return nil
        }else {
            let downloadOperation = NCImageDownloadOperation(urlString: url, shouldStore: shouldStore) {[weak self] (data, _) in
                if self != nil {
                    if let responseData = data {
                        completion(url, responseData.animatedImageFromData())
                    }else {
                        completion(url, nil)
                    }
                }
            }
            downloadOperation.performOperation()
            return downloadOperation
        }
    }
    
    func downloadImageOrUpdateImage(withUrl url: String, shouldStore: Bool, completion: @escaping ((_ url: String, _ hashable: UIImage?) -> Swift.Void), updateWithChange: ((_ url: String, _ image: UIImage?) -> Swift.Void)? = nil) -> Operation? {
        
        if FileManager.default.fileExists(atPath: NCImageDownloadOperation.pathForDictionary.appendingPathComponent(url.md5).path) {
            if let responseData = FileManager.default.contents(atPath: NCImageDownloadOperation.pathForDictionary.appendingPathComponent(url.md5).path) {
                print("file exists")
                completion(url, responseData.animatedImageFromData())
                //The file exists but check if actual data is changed
                DispatchQueue.global(qos: .background).async {
                    let downloadOperation = NCImageDownloadOperation(urlString: url, shouldStore: shouldStore, completion: {[weak self] (newData, error) in
                        guard self != nil else {return}
                        if let data = newData{
                            if responseData != data{//unequal
                                print("unequal....")
                                updateWithChange!(url, data.animatedImageFromData())
                            }else{//equal
                                print("equal....")
                            }
                        }
                        
                    })
                    downloadOperation.performOperation()
                    
                }
            }else {
                completion(url, nil)
            }
            return nil
        }else {
            let downloadOperation = NCImageDownloadOperation(urlString: url, shouldStore: shouldStore) {[weak self] (data, _) in
                if self != nil {
                    if let responseData = data {
                        completion(url, responseData.animatedImageFromData())
                    }else {
                        completion(url, nil)
                    }
                }
            }
            downloadOperation.performOperation()
            return downloadOperation
        }
        return nil
    }
    
    
    func downloadImage(usingNSCache url: String, shouldStore: Bool, completion: @escaping ((_ url: String, _ hashable: UIImage?) -> Swift.Void), updateWithChange: ((_ url: String, _ image: UIImage?) -> Swift.Void)? = nil) -> Operation?{
        if let cachedImage = NCImageLoadmanagerNSCache.shared.imageCache.object(forKey: NSString(string: url)) {
            completion(url, cachedImage)
            if let cahedImaegData = UIImagePNGRepresentation(cachedImage) as NSData?{
                //Background download and check if existing data is NOT same as new data
                let downloadOperation = NCImageDownloadOperation(urlString: url, shouldStore: shouldStore, completion: {[weak self] (data, error) in
                    guard self != nil else {return}
                    if let oldData = cahedImaegData as? Data{
                        if oldData != data{//unequal
                            if let responseData = data {
                                updateWithChange!(url, responseData.animatedImageFromData())
                            }
                        }else{//equal
                            
                        }
                    }
                    
                })
                downloadOperation.performOperation()
                return downloadOperation
            }
        }else{
            let downloadOperation = NCImageDownloadOperation(urlString: url, shouldStore: shouldStore) {[weak self] (data, _) in
                if self != nil {
                    if let responseData = data {
                        completion(url, responseData.animatedImageFromData())
                    }else {
                        completion(url, nil)
                    }
                }
            }
            downloadOperation.performOperation()
            return downloadOperation
        }
        return nil
    }
    
}
