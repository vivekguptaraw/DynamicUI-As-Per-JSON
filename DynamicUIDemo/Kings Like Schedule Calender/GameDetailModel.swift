//
//  GameDetailModel.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 29/05/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import Foundation

struct GameDetailModel {
    var is_pp: NSNumber = 0
    var arena_city: String = ""
    var clock: String = ""
    var mid: String = ""
    var gdte: Date?
    var gcode: String = ""
    var attendance: String = ""
    var period: String = ""
    var broadcast_details: String = ""
    var buy_tickets: String = ""
    var is_tbd: String = ""
    var game_status: String = ""
    var lead_change: Int = 0
    var arena_state: String = ""
    var league_id: String = ""
    var game_status_state: String = ""
    var arena_name: String = ""
    var gid: String = ""
    var year: String = ""
    var game_duration: String = ""
    var times_tied: Int = 0
    static var dateFormatter = DateFormatter()
    
    init(json: [String: Any]) {
        if let a = json["is_pp"] as? NSNumber{
            is_pp = a
        }
        if let a = json["arena_city"] as? String{
            arena_city = a
        }
        if let a = json["clock"] as? String{
            clock = a
        }
        if let a = json["mid"] as? String{
            mid = a
        }
        if let a = json["gdte"] as? String{
            let dateFormatter = GameDetailModel.dateFormatter //2017-10-03 02:00:00 +0000
        
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'T'Z"
            self.gdte = dateFormatter.date(from: a)
            if self.gdte == nil {
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                self.gdte = dateFormatter.date(from: a)
            }
        } //2017-10-03 02:00:00 +0000
        if let a = json["gcode"] as? String{
            gcode = a
        }
        if let a = json["attendance"] as? String{
            attendance = a
        }
        if let a = json["period"] as? String{
            period = a
        }
        if let a = json["broadcast_details"] as? String{
            broadcast_details = a
        }
        if let a = json["buy_tickets"] as? String{
            buy_tickets = a
        }
        if let a = json["is_tbd"] as? String{
            is_tbd = a
        }
        if let a = json["game_status"] as? String{
            game_status = a
        }
        if let a = json["lead_change"] as? Int{
            lead_change = a
        }
        if let a = json["arena_state"] as? String{
            arena_state = a
        }
        if let a = json["league_id"] as? String{
            league_id = a
        }
        if let a = json["game_status_state"] as? String{
            game_status_state = a
        }
        if let a = json["arena_name"] as? String{
            arena_name = a
        }
        
        if let a = json["gid"] as? String{
            gid = a
        }
        if let a = json["year"] as? String{
            year = a
        }
        if let a = json["game_duration"] as? String{
            game_duration = a
        }
        if let a = json["times_tied"] as? Int{
            times_tied = a
        }
    }
}
