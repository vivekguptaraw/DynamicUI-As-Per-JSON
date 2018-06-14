//
//  NCPlayerDataModel.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 14/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import Foundation

struct NCPlayerDataModel {
    var first_name: String = ""
    var last_name: String = ""
    var player_id: String = ""
    var jersey: String = ""
    var position: String = ""
    
    init(json: [String: Any]) {
        if let f = json["first_name"] as? String{
            first_name = f
        }
        if let f = json["last_name"] as? String{
            last_name = f
        }
        if let f = json["player_id"] as? String{
            player_id = f
        }
        if let f = json["jersey"] as? String{
            jersey = f
        }
        if let f = json["position"] as? String{
            position = f
        }
    }
}

struct NCCoachDataModel {
    var first_name: String = ""
    var last_name: String = ""
    var coach_id: String = ""
    var position: String = ""
    
    init(json: [String: Any]) {
        if let f = json["first_name"] as? String{
            first_name = f
        }
        if let f = json["last_name"] as? String{
            last_name = f
        }
        if let f = json["coach_id"] as? String{
            coach_id = f
        }
        if let f = json["position"] as? String{
            position = f
        }
    }
}







let jsonCoaches: [[String: Any]] =
[
    [
        "team_id" : "1610612748",
        "coach_id" : "201682",
        "first_name" : "OCTAVIO",
        "last_name" : "DE LA GRANA",
        "headshot_image_url" : "",
        "dob" : "",
        "bio" : "<p>This is test bio.</p>",
        "position " : "ASSISTANT COACH",
        "hometown" : "",
        "college" : "",
        "uid" : "blt0ebcb73cab18c273",
        "action_image_url" : "",
        "league_id" : "0"
    ],
    [
        "team_id" : "1610612748",
        "coach_id" : "201682",
        "first_name" : "OCTAVIO",
        "last_name" : "DE LA GRANA",
        "headshot_image_url" : "",
        "dob" : "",
        "bio" : "<p>This is test bio.</p>",
        "position " : "ASSISTANT COACH",
        "hometown" : "",
        "college" : "",
        "uid" : "blt0ebcb73cab18c273",
        "action_image_url" : "",
        "league_id" : "0"
    ],
    [
        "team_id" : "1610612748",
        "coach_id" : "201682",
        "first_name" : "OCTAVIO",
        "last_name" : "DE LA GRANA",
        "headshot_image_url" : "",
        "dob" : "",
        "bio" : "<p>This is test bio.</p>",
        "position " : "ASSISTANT COACH",
        "hometown" : "",
        "college" : "",
        "uid" : "blt0ebcb73cab18c273",
        "action_image_url" : "",
        "league_id" : "0"
    ],
    [
        "team_id" : "1610612748",
        "coach_id" : "201682",
        "first_name" : "OCTAVIO",
        "last_name" : "DE LA GRANA",
        "headshot_image_url" : "",
        "dob" : "",
        "bio" : "<p>This is test bio.</p>",
        "position " : "ASSISTANT COACH",
        "hometown" : "",
        "college" : "",
        "uid" : "blt0ebcb73cab18c273",
        "action_image_url" : "",
        "league_id" : "0"
    ],
    [
        "team_id" : "1610612748",
        "coach_id" : "201682",
        "first_name" : "OCTAVIO",
        "last_name" : "DE LA GRANA",
        "headshot_image_url" : "",
        "dob" : "",
        "bio" : "<p>This is test bio.</p>",
        "position " : "ASSISTANT COACH",
        "hometown" : "",
        "college" : "",
        "uid" : "blt0ebcb73cab18c273",
        "action_image_url" : "",
        "league_id" : "0"
    ]
    
]










let jsonPlayerModel: [[String: Any]] =
[
    [
        "sort_name": "ADEBAYOBAM",
        "first_name": "BAM",
        "last_name": "ADEBAYO",
        "height": "6'10",
        "prior_to_nba": "Kentucky/USA",
        "player_id": "1628389",
        "position": "CENTER-FORWARD",
        "team_id": "1610612748",
        "built_id": "blt96582f88ed358f00",
        "weight": 255,
        "yrs_exp":  0,
        "bio ": "<p>BAM ADEBAYO - NBA ROSTER</p><br>",
        "age ": 20,
        "jersey": "13",
        "league_id": 0
    ],
    [
        "sort_name": "WADe",
        "first_name": "WADE",
        "last_name": "LastName here",
        "height": "6'10",
        "prior_to_nba": "Kentucky/USA",
        "player_id": "1628389",
        "position": "CENTER-FORWARD",
        "team_id": "1610612748",
        "built_id": "blt96582f88ed358f00",
        "weight": 255,
        "yrs_exp":  0,
        "bio ": "<p>BAM ADEBAYO - NBA ROSTER</p><br>",
        "age ": 20,
        "jersey": "14",
        "league_id": 0
    ],
    [
        "sort_name": "ADEBAYOBAM",
        "first_name": "BAM",
        "last_name": "ADEBAYO",
        "height": "6'10",
        "prior_to_nba": "Kentucky/USA",
        "player_id": "1628389",
        "position": "CENTER-FORWARD",
        "team_id": "1610612748",
        "built_id": "blt96582f88ed358f00",
        "weight": 255,
        "yrs_exp":  0,
        "bio ": "<p>BAM ADEBAYO - NBA ROSTER</p><br>",
        "age ": 20,
        "jersey": "13",
        "league_id": 0
    ],
    [
        "sort_name": "WADe",
        "first_name": "WADE",
        "last_name": "LastName here",
        "height": "6'10",
        "prior_to_nba": "Kentucky/USA",
        "player_id": "1628389",
        "position": "CENTER-FORWARD",
        "team_id": "1610612748",
        "built_id": "blt96582f88ed358f00",
        "weight": 255,
        "yrs_exp":  0,
        "bio ": "<p>BAM ADEBAYO - NBA ROSTER</p><br>",
        "age ": 20,
        "jersey": "14",
        "league_id": 0
    ],
    [
        "sort_name": "ADEBAYOBAM",
        "first_name": "BAM",
        "last_name": "ADEBAYO",
        "height": "6'10",
        "prior_to_nba": "Kentucky/USA",
        "player_id": "1628389",
        "position": "CENTER-FORWARD",
        "team_id": "1610612748",
        "built_id": "blt96582f88ed358f00",
        "weight": 255,
        "yrs_exp":  0,
        "bio ": "<p>BAM ADEBAYO - NBA ROSTER</p><br>",
        "age ": 20,
        "jersey": "13",
        "league_id": 0
    ],
    [
        "sort_name": "WADe",
        "first_name": "WADE",
        "last_name": "LastName here",
        "height": "6'10",
        "prior_to_nba": "Kentucky/USA",
        "player_id": "1628389",
        "position": "CENTER-FORWARD",
        "team_id": "1610612748",
        "built_id": "blt96582f88ed358f00",
        "weight": 255,
        "yrs_exp":  0,
        "bio ": "<p>BAM ADEBAYO - NBA ROSTER</p><br>",
        "age ": 20,
        "jersey": "14",
        "league_id": 0
    ]
    ,[
        "sort_name": "ADEBAYOBAM",
        "first_name": "BAM",
        "last_name": "ADEBAYO",
        "height": "6'10",
        "prior_to_nba": "Kentucky/USA",
        "player_id": "1628389",
        "position": "CENTER-FORWARD",
        "team_id": "1610612748",
        "built_id": "blt96582f88ed358f00",
        "weight": 255,
        "yrs_exp":  0,
        "bio ": "<p>BAM ADEBAYO - NBA ROSTER</p><br>",
        "age ": 20,
        "jersey": "13",
        "league_id": 0
    ],
     [
        "sort_name": "WADe",
        "first_name": "WADE",
        "last_name": "LastName here",
        "height": "6'10",
        "prior_to_nba": "Kentucky/USA",
        "player_id": "1628389",
        "position": "CENTER-FORWARD",
        "team_id": "1610612748",
        "built_id": "blt96582f88ed358f00",
        "weight": 255,
        "yrs_exp":  0,
        "bio ": "<p>BAM ADEBAYO - NBA ROSTER</p><br>",
        "age ": 20,
        "jersey": "14",
        "league_id": 0
    ]
    ,[
        "sort_name": "ADEBAYOBAM",
        "first_name": "BAM",
        "last_name": "ADEBAYO",
        "height": "6'10",
        "prior_to_nba": "Kentucky/USA",
        "player_id": "1628389",
        "position": "CENTER-FORWARD",
        "team_id": "1610612748",
        "built_id": "blt96582f88ed358f00",
        "weight": 255,
        "yrs_exp":  0,
        "bio ": "<p>BAM ADEBAYO - NBA ROSTER</p><br>",
        "age ": 20,
        "jersey": "13",
        "league_id": 0
    ],
     [
        "sort_name": "WADe",
        "first_name": "WADE",
        "last_name": "LastName here",
        "height": "6'10",
        "prior_to_nba": "Kentucky/USA",
        "player_id": "1628389",
        "position": "CENTER-FORWARD",
        "team_id": "1610612748",
        "built_id": "blt96582f88ed358f00",
        "weight": 255,
        "yrs_exp":  0,
        "bio ": "<p>BAM ADEBAYO - NBA ROSTER</p><br>",
        "age ": 20,
        "jersey": "14",
        "league_id": 0
    ]
]
