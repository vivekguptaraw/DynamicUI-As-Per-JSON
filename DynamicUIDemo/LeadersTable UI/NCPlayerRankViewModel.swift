//
//  NCPlayerRankViewModel.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 12/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import Foundation

struct PlayerRankViewModel {
    
    var rankTitle = ""
    var playerDetail:[TeamStatPlayerDetail] = []
    var chartValue: [CGFloat] = []
    
    init(json: [String: Any]) {
        if let r = json["rankTitle"] as? String{
            self.rankTitle = r
        }
        if let d = json["playerDetail"] as? [[String: Any]]{
            for obj in d{
                if let model = obj as? [String: String]{
                    let teamStatPlayerDetail = TeamStatPlayerDetail(data: model)
                    playerDetail.append(teamStatPlayerDetail)
                }
            }
        }
        if let c = json["chartValue"] as? [Int]{
            for obj in c{
                self.chartValue.append(CGFloat(obj))
            }
        }
    }
    
}

struct TeamStatPlayerDetail {
    
    var playerName:String!
    var playerImageUrl: String!
    var playerPoints:String!
    
    init(data :[String:String]) {
        
        playerName = (data["player_name"] != nil) ? data["player_name"] : "Not mentioned"
        playerPoints = (data["player_points"] != nil) ? data["player_points"] : "--"
        playerImageUrl = (data["player_url"] != nil) ? data["player_url"] : "--"
    }
    
}

let jsonPlayerRankViewModel: [[String: Any]] =
[
   [ "rankTitle" : "POINTS PER GAME",
    "playerDetail" : [
        [
            "player_name" : "ADEBAYO",
            "player_points" : "45.2",
            "player_url" : "p1"],
        [
            "player_name" : "OLYNYK",
            "player_points" : "69.2",
            "player_url" : "p2"],
        [
            "player_name" : "Wade",
            "player_points" : "57.2",
            "player_url" : "p3"],
    ],
    "chartValue" : [35,34,31]
    ],
   [ "rankTitle" : "REBOUNDS PER GAME",
     "playerDetail" : [
        [
            "player_name" : "OLYNYK",
            "player_points" : "69.2",
            "player_url" : "p2"],
        [
            "player_name" : "ADEBAYO",
            "player_points" : "45.2",
            "player_url" : "p1"],
        [
            "player_name" : "Wade",
            "player_points" : "57.2",
            "player_url" : "p3"],
    ],
     "chartValue" : [50,20,30]
    ],
   [ "rankTitle" : "FIELD GOAL %",
     "playerDetail" : [
        
        [
            "player_name" : "ADEBAYO",
            "player_points" : "45.2",
            "player_url" : "p1"],
        [
            "player_name" : "Wade",
            "player_points" : "57.2",
            "player_url" : "p3"],
        [
            "player_name" : "OLYNYK",
            "player_points" : "69.2",
            "player_url" : "p2"],
    ],
     "chartValue" : [20,55,25]
    ],
   [ "rankTitle" : "BLOCKS PER GAME",
     "playerDetail" : [
        [
            "player_name" : "OLYNYK",
            "player_points" : "69.2",
            "player_url" : "p2"],
        [
            "player_name" : "ADEBAYO",
            "player_points" : "45.2",
            "player_url" : "p1"],
        [
            "player_name" : "Wade",
            "player_points" : "57.2",
            "player_url" : "p3"],
    ],
     "chartValue" : [30,35,35]
    ],
   [ "rankTitle" : "EXTRA JSON INSERTED",
     "playerDetail" : [
        [
            "player_name" : "OLYNYK",
            "player_points" : "69.2",
            "player_url" : "p2"],
        [
            "player_name" : "ADEBAYO",
            "player_points" : "45.2",
            "player_url" : "p1"],
        [
            "player_name" : "Wade",
            "player_points" : "57.2",
            "player_url" : "p3"],
    ],
     "chartValue" : [90,5,5]
    ],
   [ "rankTitle" : "EXTRA NEW JSON INSERTED",
     "playerDetail" : [
        [
            "player_name" : "OLYNYK",
            "player_points" : "69.2",
            "player_url" : "p2"],
        [
            "player_name" : "ADEBAYO",
            "player_points" : "45.2",
            "player_url" : "p1"],
        [
            "player_name" : "Wade",
            "player_points" : "57.2",
            "player_url" : "p3"],
    ],
     "chartValue" : [15,15,70]
    ],
]
