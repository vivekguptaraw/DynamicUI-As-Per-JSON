//
//  PlayByPlay.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 15/05/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import Foundation

class PlayByPlay{
    var locx: Double?
    var pid: String?
    var current_session: Int?
    var cl: String?
    var opt1: Double?
    var vs: Int?
    var gcode: String?
    var hs: Int?
    var mtype: Int?
    var uid: String?
    var desc: String?
    var scoreDiff: Int?
    var tid: String?
    var locy: Double?
    var opt2: Double?
    var gid: String?
    var opid: Int?
    var etype: Int?
    var evt: Int?
    
    init(json: [String: Any]){
        if let l = json["locx"] as? NSNumber{
            self.locx = l.doubleValue
        }
        if let p = json["pid"] as? String{
            self.pid = p
        }
        if let c = json["current_session"] as? Int{
            self.current_session = c
        }
        if let l = json["cl"] as? String{
            self.cl = l
        }
        if let p = json["opt1"] as? NSNumber{
            self.opt1 = p.doubleValue
        }
        if let v = json["vs"] as? Int{
            self.vs = v
        }
        if let g = json["gcode"] as? String{
            self.gcode = g
        }
        if let p = json["hs"] as? Int{
            self.hs = p
        }
        if let m = json["mtype"] as? Int{
            self.mtype = m
        }
        if let u = json["uid"] as? String{
            self.uid = u
        }
        if let d = json["desc"] as? String{
            self.desc = d
        }
        if let s = json["scoreDiff"] as? Int{
            self.scoreDiff = s
        }
        if let t = json["tid"] as? String{
            self.tid = t
        }
        if let l = json["locy"] as? NSNumber{
            self.locy = l.doubleValue
        }
        if let s = json["opt2"] as? NSNumber{
            self.opt2 = s.doubleValue
        }
        
        if let g = json["gid"] as? String{
            self.gid = g
        }
        if let o = json["opid"] as? Int{
            self.opid = o
        }
        if let l = json["etype"] as? Int{
            self.etype = l
        }
        if let s = json["evt"] as? Int{
            self.evt = s
        }
        
    }
}
