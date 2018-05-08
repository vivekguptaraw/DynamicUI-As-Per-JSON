//
//  DataManager.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 20/04/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import Foundation
import UIKit

class TableData{
    var dataSourceArray: [[ControlCreateModel]] = []
    var cellSize = CGSize.zero
    init(json: [[ControlCreateModel]]) {
        self.dataSourceArray = json
    }
}


class DataManager{
    
    static let shared: DataManager = DataManager()
    
    init() {
        
    }
    
    func readDataForCell(completion: (([TableData]) -> Void)? = nil){
        let data = jsonObjectCell
        var tableArray = [TableData]()
        if let result = data as? [[[String: Any]]]{            
            for cellData in result{
                var arr: [ControlCreateModel] = []
                var cellSize = CGSize.zero
                cellSize.width = UIScreen.main.bounds.width
                for item in cellData{
                    if (item as? [String: Any]) != nil{
                        let model = ControlCreateModel(jsonDict: item)
                        if let childArray = model.childControlsArray{
                            _ = childArray.map{ obj in
                                if obj.isKind(of: UIViewControlView.self){
                                    let vw = obj as! UIViewControlView
                                    if vw.height > model.size.height{
                                        model.size.height += vw.height - model.size.height + (model.padding * 2)
                                    }else if vw.height < model.size.height - (vw.padding * 2) {
                                        model.size.height = vw.height +  (model.padding * 2)
                                    }
                                }
                            }
                        }
                        cellSize.height += model.size.height
                        arr.append(model)
                    }
                }
                let tableData = TableData(json: [arr])
                tableData.cellSize = cellSize
                tableArray.append(tableData)
            }
        }
        completion?(tableArray)
    }
    
    func readDataForWithoutCollection(completion: (([ControlCreateModel]) -> Void)? = nil){
        let data = jsonObject2
        if let result = data as? [String: [[String: Any]]]{
            if let internalArray = result["objects"]{
                let sorted = internalArray.sorted(by: { (v1, v2) -> Bool in
                    let num1 = v1["number"] as! Int
                    let num2 = v2["number"] as! Int
                    return num1 < num2
                })
                var arr: [ControlCreateModel] = []
                
                for obj in sorted{
                    if (obj as? [String: Any]) != nil{
                        let model = ControlCreateModel(jsonDict: obj)
                        arr.append(model)
                        
                    }
                }
                completion!(arr)
            }
        }
    }
    
    func readData(completion: (([ControlCreateModel]) -> Void)? = nil){
        let data = jsonObject
        if let result = data as? [String: [[String: Any]]]{
            if let internalArray = result["objects"]{
                let sorted = internalArray.sorted(by: { (v1, v2) -> Bool in
                    let num1 = v1["number"] as! Int
                    let num2 = v2["number"] as! Int
                    return num1 < num2
                })
                var arr: [ControlCreateModel] = []
                for obj in sorted{
                    if (obj as? [String: Any]) != nil{
                        let model = ControlCreateModel(jsonDict: obj)
                        arr.append(model)
                    }
                }
                completion!(arr)
            }
        }
    }
}
