//
//  jsonObjectsClass.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 26/04/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import Foundation

let jsonObjectCell: [[[String: Any]]] =
    [
        [[   "type" : "carousel",
            "portionCoveredPerc": 30,
            "number": 1,
            "backgroundColor" : "00ffff",
            "padding" : 0,
            "autoSpreadChild" : true,
            "childrens":
                [
                    "horizontal":[
                        [
                            "type" : "imageview",
                            "portionCoveredPerc" : 100,
                            "number": 1,
                            "url": "Nature1"
                        ],
                        [
                            "type" : "imageview",
                            "portionCoveredPerc" : 100,
                            "number": 2,
                            "url": "Nature2"
                        ],
                        [
                            "type" : "imageview",
                            "portionCoveredPerc" : 100,
                            "number": 3,
                            "url": "Nature3"
                        ]
                    ]
            ]
            ],
         ],
        [
            [   "type" : "uiview",
                "portionCoveredPerc": 50,
                "number": 1,
                "backgroundColor" : "ffffff",
                "padding" : 10,
                "autoSpreadChild" : false,
                "childrens":[
                    "horizontal":[
                        [   "type" : "uiview",
                            "portionCoveredPerc": 100,
                            "number": 1,
                            "backgroundColor" : "323232",
                            "padding" : 0,
                            "autoSpreadChild" : false,
                            "layersapplied": [
                                "layerprops":[
                                    "bordercolor" : "dddddd",
                                    "borderwidth" : 1,
                                    "cornerradius" : 0
                                ]
                            ],
                            "childrens":[
                                "vertical":[
                                    [
                                        "type" : "uiview",
                                        "portionCoveredPerc": 40,
                                        "number": 1,
                                        "backgroundColor" : "323232",
                                        "padding" : 10,
                                        "autoSpreadChild" : false,
                                        "childhorizontalrendering" : "left",
                                        "childrens":[
                                            "horizontal":[
                                                [
                                                    "type" : "imageview",
                                                    "portionCoveredPerc" : 40,
                                                    "number": 1,
                                                    "url": "Car1"
                                                ],
                                                [   "type" : "uiview",
                                                    //"portionCoveredPerc" : 1,
                                                    "height": 120,
                                                    "width" : 1,
                                                    "number": 2,
                                                    "backgroundColor" : "FF0000",
                                                    "padding" : 0,
                                                    ],
                                                [
                                                    "tag": "nestedChildView",
                                                    "type" : "uiview",
                                                    "portionCoveredPerc": 55,
                                                    "number": 3,
                                                    "backgroundColor" : "323232",
                                                    "padding" : 0,
                                                    "autoSpreadChild" : true,
                                                    "childhorizontalrendering" : "left",
                                                    "childrens":[
                                                        "horizontal":[
                                                            [
                                                                "type" : "label",
                                                                "number": 3,
                                                                "text": "API design is very much like user interface and user experience design. Your target audience has different needs and characteristics, but they're still humans who are looking to get a job done. As with a friendly, usable app UI, you’re still trying to make your API",
                                                                "numberOfLines": 5,
                                                                "textalignment": "left",
                                                                "backgroundColor" : "CCDCF0",
                                                                "padding" : 10
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ],
                                    [
                                        "type" : "label",
                                        "number": 2,
                                        "text": "hey its multiline label and will GROW as per the contents,kbsvbbgbgb ggpp plz set number of lines you want to see kbsvbbgbgb ggpp plz set number of lines you want to see hey its multiline and will GROW as per the contents,kbsvbbgbgb of lines you want to see hey its multiline label and will GROW as per the contents,kbsvbbgbgb ggpp plz set number of lines you want to see kbsvbbgbgb ggpp plzlonngggg",
                                        "numberOfLines": 5,
                                        "textalignment": "left",
                                        "backgroundColor" : "CCDCF0",
                                        "padding" : 10
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ],
            [   "type" : "uiview",
                "portionCoveredPerc": 50,
                "number": 2,
                "backgroundColor" : "ffffff",
                "padding" : 10,
                "autoSpreadChild" : false,
                "childrens":[
                    "horizontal":[
                        [   "type" : "uiview",
                            "portionCoveredPerc": 100,
                            "number": 1,
                            "backgroundColor" : "323232",
                            "padding" : 0,
                            "autoSpreadChild" : false,
                            "layersapplied": [
                                "layerprops":[
                                    "bordercolor" : "dddddd",
                                    "borderwidth" : 1,
                                    "cornerradius" : 0
                                ]
                            ],
                            "childrens":[
                                "vertical":[
                                    [
                                        "type" : "uiview",
                                        "portionCoveredPerc": 40,
                                        "number": 1,
                                        "backgroundColor" : "323232",
                                        "padding" : 10,
                                        "autoSpreadChild" : false,
                                        "childhorizontalrendering" : "left",
                                        "childrens":[
                                            "horizontal":[
                                                [
                                                    "type" : "imageview",
                                                    "portionCoveredPerc" : 40,
                                                    "number": 1,
                                                    "url": "Car1"
                                                ],
                                                [   "type" : "uiview",
                                                    //"portionCoveredPerc" : 1,
                                                    "height": 120,
                                                    "width" : 1,
                                                    "number": 2,
                                                    "backgroundColor" : "FF0000",
                                                    "padding" : 0,
                                                    ],
                                                [
                                                    "tag": "nestedChildView",
                                                    "type" : "uiview",
                                                    "portionCoveredPerc": 55,
                                                    "number": 3,
                                                    "backgroundColor" : "323232",
                                                    "padding" : 0,
                                                    "autoSpreadChild" : true,
                                                    "childhorizontalrendering" : "left",
                                                    "childrens":[
                                                        "horizontal":[
                                                            [
                                                                "type" : "label",
                                                                "number": 3,
                                                                "text": "API design is very much like user interface and user experience design. Your target audience has different needs and characteristics, but they're still humans who are looking to get a job done. As with a friendly, usable app UI, you’re still trying to make your API",
                                                                "numberOfLines": 5,
                                                                "textalignment": "left",
                                                                "backgroundColor" : "CCDCF0",
                                                                "padding" : 10
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ],
                                    [
                                        "type" : "label",
                                        "number": 2,
                                        "text": "hey its multiline label and will GROW as per the contents,kbsvbbgbgb ggpp plz set number of lines you want to see kbsvbbgbgb ggpp plz set number of lines you want to see hey its multiline and will GROW as per the contents,kbsvbbgbgb of lines you want to see hey its multiline label and will GROW as per the contents,kbsvbbgbgb ggpp plz set number of lines you want to see kbsvbbgbgb ggpp plzlonngggg",
                                        "numberOfLines": 5,
                                        "textalignment": "left",
                                        "backgroundColor" : "CCDCF0",
                                        "padding" : 10
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
            ],
        [
            [   "type" : "uiview",
                "portionCoveredPerc": 50,
                "number": 3,
                "backgroundColor" : "ffffff",
                "padding" : 10,
                "autoSpreadChild" : false,
                "childrens":[
                    "horizontal":[
                        [   "type" : "uiview",
                            "portionCoveredPerc": 100,
                            "number": 1,
                            "backgroundColor" : "323232",
                            "padding" : 0,
                            "autoSpreadChild" : false,
                            "layersapplied": [
                                "layerprops":[
                                    "bordercolor" : "dddddd",
                                    "borderwidth" : 1,
                                    "cornerradius" : 0
                                ]
                            ],
                            "childrens":[
                                "vertical":[
                                    [
                                        "type" : "uiview",
                                        "portionCoveredPerc": 40,
                                        "number": 1,
                                        "backgroundColor" : "323232",
                                        "padding" : 10,
                                        "autoSpreadChild" : false,
                                        "childhorizontalrendering" : "left",
                                        "childrens":[
                                            "horizontal":[
                                                [
                                                    "type" : "imageview",
                                                    "portionCoveredPerc" : 55,
                                                    "number": 3,
                                                    "url": "Car1"
                                                ],
                                                [   "type" : "uiview",
                                                    //"portionCoveredPerc" : 1,
                                                    "height": 120,
                                                    "width" : 1,
                                                    "number": 2,
                                                    "backgroundColor" : "FF0000",
                                                    "padding" : 0,
                                                ],
                                                [
                                                    "tag": "nestedChildView",
                                                    "type" : "uiview",
                                                    "portionCoveredPerc": 40,
                                                    "number": 1,
                                                    "backgroundColor" : "323232",
                                                    "padding" : 0,
                                                    "autoSpreadChild" : true,
                                                    "childhorizontalrendering" : "left",
                                                    "childrens":[
                                                        "horizontal":[
                                                            [
                                                                "type" : "label",
                                                                "number": 3,
                                                                "text": "Triying another change",
                                                                "numberOfLines": 5,
                                                                "textalignment": "left",
                                                                "backgroundColor" : "CCDCF0",
                                                                "padding" : 10
                                                            ]
                                                            ]
                                                        ]
                                                    ]
                                            ]
                                        ]
                                    ],
                                    [
                                        "type" : "label",
                                        "number": 2,
                                        "text": "hey its multiline label and will GROW as per the contents,kbsvbbgbgb ggpp plz vbbgbgb ggpp plz set number of lines you want to see kbsvbbgbgb ggpp plzlonngggg",
                                        "numberOfLines": 5,
                                        "textalignment": "left",
                                        "backgroundColor" : "CCDCF0",
                                        "padding" : 10
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ],
            ],
        [
            [   "type" : "uiview",
                "portionCoveredPerc": 50,
                "number": 3,
                "backgroundColor" : "ffffff",
                "padding" : 10,
                "autoSpreadChild" : false,
                "childrens":[
                    "horizontal":[
                        [   "type" : "uiview",
                            "portionCoveredPerc": 100,
                            "number": 1,
                            "backgroundColor" : "323232",
                            "padding" : 0,
                            "autoSpreadChild" : false,
                            "layersapplied": [
                                "layerprops":[
                                    "bordercolor" : "dddddd",
                                    "borderwidth" : 1,
                                    "cornerradius" : 0
                                ]
                            ],
                            "childrens":[
                                "vertical":[
                                    [
                                        "type" : "uiview",
                                        "portionCoveredPerc": 40,
                                        "number": 1,
                                        "backgroundColor" : "323232",
                                        "padding" : 10,
                                        "autoSpreadChild" : false,
                                        "childhorizontalrendering" : "left",
                                        "childrens":[
                                            "horizontal":[
                                                [
                                                    "type" : "imageview",
                                                    "portionCoveredPerc" : 50,
                                                    "number": 1,
                                                    "url": "Car2"
                                                ],
                                                [   "type" : "uiview",
                                                    //"portionCoveredPerc" : 1,
                                                    "height": 120,
                                                    "width" : 1,
                                                    "number": 2,
                                                    "backgroundColor" : "FF0000",
                                                    "padding" : 0,
                                                    ],
                                                [
                                                    "tag": "nestedChildView",
                                                    "type" : "uiview",
                                                    "portionCoveredPerc": 45,
                                                    "number": 3,
                                                    "backgroundColor" : "323232",
                                                    "padding" : 0,
                                                    "autoSpreadChild" : true,
                                                    "childhorizontalrendering" : "left",
                                                    "childrens":[
                                                        "horizontal":[
                                                            [
                                                                "type" : "label",
                                                                "number": 3,
                                                                "text": "Because more and more people are living, working and playing here, we’ve established a new Traffic Plan designed to make leaving the area after a HEAT game or an Arena event a more organized and efficient process. We are confident this plan will help you get to where you need to go as quickly as possible.",
                                                                "numberOfLines": 3,
                                                                "textalignment": "left",
                                                                "backgroundColor" : "CCDCF0",
                                                                "padding" : 10
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ],
                                    [
                                        "type" : "label",
                                        "number": 2,
                                        "text": "hey its multiline label and will GROW as per the contents,kbsvbbgbgb ggpp plz set number of lines you want to see kbsvbbgbgb ggpp plz set number of lines you want to see hey its multiline and will GROW as per the contents,kbsvbbgbgb of lines you want to see hey its multiline label and will GROW as per the contents,kbsvbbgbgb ggpp plz set number of lines you want to see kbsvbbgbgb ggpp plzlonngggg",
                                        "numberOfLines": 5,
                                        "textalignment": "left",
                                        "backgroundColor" : "CCDCF0",
                                        "padding" : 10
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ],
            ],
        [
            [   "type" : "uiview",
                "portionCoveredPerc": 60,
                "number": 4,
                "backgroundColor" : "ffffff",
                "padding" : 10,
                "autoSpreadChild" : false,
                "childrens":[
                    "horizontal":[
                        [   "type" : "uiview",
                            "portionCoveredPerc": 100,
                            "number": 1,
                            "backgroundColor" : "ffffff",
                            "padding" : 0,
                            "autoSpreadChild" : false,
                            "layersapplied": [
                                "layerprops":[
                                    "bordercolor" : "dddddd",
                                    "borderwidth" : 1,
                                    "cornerradius" : 0
                                ]
                            ],
                            "childrens":[
                                "vertical":[
                                    [
                                        "type" : "imageview",
                                        "portionCoveredPerc" : 40,
                                        "number": 1,
                                        "url": "testImage"
                                        
                                        
                                    ],
                                    [
                                        "type" : "label",
                                        "number": 1,
                                        "text": "My title dining",
                                        "numberOfLines": 1,
                                        "textalignment": "center",
                                        "backgroundColor" : "CCDCF0",
                                        "padding" : 5
                                    ],
                                    [
                                        "type" : "label",
                                        "number": 2,
                                        "text": "hey its multiline label and will GROW as per the contents,kbsvbbgbgb ggpp plz set number of lines you want to see kbsvbbgbgb ggpp plz set number of lines you want to see hey its multiline and will GROW as per the contents,kbsvbbgbgb of lines you want to see hey its multiline label and will GROW as per the contents,kbsvbbgbgb ggpp plz set number of lines you want to see kbsvbbgbgb ggpp plzlonngggg",
                                        "numberOfLines": 5,
                                        "textalignment": "center",
                                        "backgroundColor" : "CCDCF0",
                                        "padding" : 10
                                    ],
                                    [
                                        "type" : "uiview",
                                        "portionCoveredPerc": 14,
                                        "number": 4,
                                        "backgroundColor" : "ffffff",
                                        "padding" : 10,
                                        "autoSpreadChild" : true,
                                        "sideSpacing" : 10,
                                        "layersapplied": [
                                            "layerprops":[
                                                "bordercolor" : "000000",
                                                "borderwidth" : 1,
                                                "cornerradius" : 5
                                            ]
                                        ],
                                        "childrens":[
                                        "horizontal":[
                                            [
                                                "type" : "button",
                                                "height" : 44,
                                                "width" : 250,
                                                "parameter": [
                                                    "query" :
                                                        [ "id" : "78999111",
                                                          "deeplink" : "kings://gamedetailFromChildcool"
                                                    ]
                                                ],
                                                "title" : "Request reservation",
                                                "backgroundColor" : "ffb6c1",
                                                "number": 1
                                            ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ],
        ],
        [
            [   "type" : "uiview",
                "portionCoveredPerc": 60,
                "number": 5,
                "backgroundColor" : "ffffff",
                "padding" : 10,
                "autoSpreadChild" : false,
                "childrens":[
                    "horizontal":[
                        [   "type" : "uiview",
                            "portionCoveredPerc": 100,
                            "number": 1,
                            "backgroundColor" : "ffffff",
                            "padding" : 0,
                            "autoSpreadChild" : false,
                            "layersapplied": [
                                "layerprops":[
                                    "bordercolor" : "dddddd",
                                    "borderwidth" : 1,
                                    "cornerradius" : 0
                                ]
                            ],
                            "childrens":[
                                "vertical":[
                                    [
                                        "type" : "imageview",
                                        "portionCoveredPerc" : 60,
                                        "number": 1,
                                        "url": "testImage"
                                        
                                        
                                    ],
                                    [
                                        "type" : "label",
                                        "number": 2,
                                        "text": "hey its multiline label and will GROW as per the contents,kbsvbbgbgb ggpp plz set number of lines you want to see kbsvbbgbgb ggpp plz set number of lines yggpp plz set number of lines you want to see kbsvbbgbgb ggpp plzlonngggg",
                                        "numberOfLines": 3,
                                        "textalignment": "center",
                                        "backgroundColor" : "CCDCF0",
                                        "padding" : 10
                                    ],
                                    [
                                        "type" : "label",
                                        "number": 3,
                                        "text": "hey its multiline label and will GROW as per the contents,kbsvbbgbgb ggpp plz set number of lines you want to see kbsvbbgbgb ggpp plz set number of lines you want to see hey its multiline and will GROW as per the contents,kbsvbbgbgb of lines you want to see hey its multiline label and will GROW as per the contents,kbsvbbgbgb ggpp plz set number of lines you want to see kbsvbbgbgb ggpp plzlonngggg",
                                        "numberOfLines": 6,
                                        "textalignment": "center",
                                        "backgroundColor" : "CCDCF0",
                                        "padding" : 10
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ],
            ],
        [
            [   "type" : "uiview",
                "portionCoveredPerc": 60,
                "number": 6,
                "backgroundColor" : "ffffff",
                "padding" : 10,
                "autoSpreadChild" : false,
                "childrens":[
                    "horizontal":[
                        [   "type" : "uiview",
                            "portionCoveredPerc": 100,
                            "number": 1,
                            "backgroundColor" : "ffffff",
                            "padding" : 0,
                            "autoSpreadChild" : false,
                            "layersapplied": [
                                "layerprops":[
                                    "bordercolor" : "dddddd",
                                    "borderwidth" : 1,
                                    "cornerradius" : 0
                                ]
                            ],
                            "childrens":[
                                "vertical":[
                                    [
                                        "type" : "imageview",
                                        "portionCoveredPerc" : 40,
                                        "number": 1,
                                        "url": "testImage"
                                        
                                        
                                    ],
                                    [
                                        "type" : "label",
                                        "number": 2,
                                        "text": "hey its multiline label and will GROW as per the contents,kbsvbbgbgb ggpp plz set number of lines you want to see kbsvbbgbgb ggpp plz set number of lines yggpp plz set number of lines you want to see kbsvbbgbgb ggpp plzlonngggg",
                                        "numberOfLines": 3,
                                        "textalignment": "center",
                                        "backgroundColor" : "CCDCF0",
                                        "padding" : 10
                                    ],
                                    [
                                        "type" : "label",
                                        "number": 3,
                                        "text": "hey its multiline label and will GROW as per the contents,kbsvbbgbgb ggpp plz set number of lines you want to see kbsvbbgbgb ggpp plz set number of lines you want to see hey its multiline and will GROW as per the contents,kbsvbbgbgb of lines you want to see hey its multiline label and will GROW as per the contents,kbsvbbgbgb ggpp plz set number of lines you want to see kbsvbbgbgb ggpp plzlonngggg",
                                        "numberOfLines": 3,
                                        "textalignment": "center",
                                        "backgroundColor" : "CCDCF0",
                                        "padding" : 10
                                    ],
                                    [
                                        "type" : "uiview",
                                        "portionCoveredPerc": 14,
                                        "number": 4,
                                        "backgroundColor" : "20B2AA",
                                        "padding" : 10,
                                        "autoSpreadChild" : true,
                                        "childrens":[
                                            "horizontal":[
                                                [
                                                    "type" : "button",
                                                    "height" : 44,
                                                    
                                                    "parameter": [
                                                        "query" :
                                                            [ "id" : "123456",
                                                              "deeplink" : "kings://gamedetailFromChildVivek"
                                                        ]
                                                    ],
                                                    "title" : "Request reservation",
                                                    "backgroundColor" : "ffb6c1",
                                                    "number": 1
                                                ],
                                                [
                                                    "type" : "button",
                                                    "height" : 44,
                                                    
                                                    "parameter": [
                                                        "query" :
                                                            [ "id" : "7867800009562",
                                                              "deeplink" : "kings://gamedetailFromChild0000"
                                                        ]
                                                    ],
                                                    "title" : "Request reservation",
                                                    "backgroundColor" : "ffb6c1",
                                                    "number": 2
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ],
            ]
        
        
        
        
]


let jsonObject2: [String: [[String: Any]]] =
    [ "objects" :
        [
            [
                "type" : "imageview",
                "portionCoveredPerc" : 25,
                "number": 1,
                "url": "testImage",
                "sideSpacing": 40
            ],
            
            [   "type" : "uiview",
                "portionCoveredPerc": 10,
                "number": 2,
                "backgroundColor" : "d3d3d3",
                "padding" : 10,
                "childrens":[
                    "horizontal":[
                        [
                            "type" : "button",
                            "height" : 40,
                            "width" : 200,
                            "parameter": [
                                "query" :
                                    [ "id" : "S121",
                                      "deeplink" : "kings://screendetail",
                                      "action" : "Submit"
                                ]
                            ],
                            "title" : "See Game Detail",
                            "backgroundColor" : "4567def",
                            "number": 1,
                            "hAlign" : "Left"
                        ],
                        [
                            "type" : "button",
                            "height" : 40,
                            "width" : 200,
                            "parameter": [
                                "query" :
                                    [ "id" : "S122",
                                      "deeplink" : "kings://gameschedule",
                                      "action" : "Cancel"
                                ]
                            ],
                            "title" : "Visit game schedule",
                            "backgroundColor" : "4567def",
                            "number": 1,
                            "hAlign" : "Left"
                        ]
                    ]
                ]
            ],
            [   "type" : "uiview",
                "portionCoveredPerc": 30,
                "number": 3,
                "backgroundColor" : "b1b1b1",
                "sideSpacing": 20,
                "padding" : 10,
                "childrens":
                    [
                        "vertical":[
                            [
                                "type" : "textfield",
                                "parameter": [
                                    "query" :
                                        [ "id" : "txt1",
                                          "deeplink" : "kings://gamedetailFromChild1"
                                    ]
                                ],
                                "title" : "Text field 1",
                                "backgroundColor" : "fefefe",
                                "number": 1,
                                "textalignment": "left",
                                "sideSpacing": 10,
                                "portionCoveredPerc": 40
                            ],
                            [
                                "type" : "textfield",
                                "parameter": [
                                    "query" :
                                        [ "id" : "txt1",
                                          "deeplink" : "kings://gamedetailFromChild222"
                                    ]
                                ],
                                "title" : "Text field 2",
                                "backgroundColor" : "fefefe",
                                "number": 2,
                                "textalignment": "left",
                                "sideSpacing": 10,
                                "portionCoveredPerc": 40
                            ]
                        ]
                ]
            ],
            [   "type" : "uiview",
                "portionCoveredPerc": 18,
                "number": 4,
                "backgroundColor" : "c2c2c2",
                "padding" : 15,
                "childrens":
                    [
                        "horizontal":[
                            [
                                "type" : "button",
                                "height" : 100,
                                "width" : 100,
                                "parameter": [
                                    "query" :
                                        [ "id" : "52012",
                                          "deeplink" : "kings://gamedetailFromChild1"
                                    ]
                                ],
                                "title" : "Child button 1",
                                "backgroundColor" : "030056",
                                "number": 1,
                                ],
                            [
                                "type" : "button",
                                "height" : 100,
                                "width" : 100,
                                "parameter": [
                                    "query" :
                                        [ "id" : "10689",
                                          "deeplink" : "kings://gamedetailFromChild222"
                                    ]
                                ],
                                "title" : "Child button 2",
                                "backgroundColor" : "ffb6c1",
                                "number": 2,
                                ],
                            [
                                "type" : "button",
                                "height" : 100,
                                "width" : 100,
                                "parameter": [
                                    "query" :
                                        [ "id" : "789562",
                                          "deeplink" : "kings://gamedetailFromChild333"
                                    ]
                                ],
                                "title" : "Child button 3",
                                "backgroundColor" : "ffb6c1",
                                "number": 3,
                                ]
                        ]
                ]
            ],
            [
                "type" : "label",
                "number": 5,
                "text": "hey its multiline label and will GROW as per the contents,kbsvbbgbgb ggpp plz set number of lines you want to see kbsvbbgbgb ggpp plz set number of lines you want to see hey its multiline label and will GROW as per the contents,kbsvbbgbgb ggpp plz set number of lines you want to see kbsvbbgbgb ggpp plz set number of lines you want to see hey its multiline label and will GROW as per the contents,kbsvbbgbgb ggpp plz set number of lines you want to see kbsvbbgbgb ggpp plz set number of lines you want to see, hey its multiline label and will GROW as per the contents,kbsvbbgbgb ggpp plz set number of lines you want to see kbsvbbgbgb ggpp plz set number of lines you want to see hey its multiline label and will GROW as per the contents,kbsvbbgbgb ggpp plz set number of lines you want to see kbsvbbgbgb ggpp plz set number of lines you want to see hey its multiline label and will GROW as per the contents,kbsvbbgbgb ggpp plz set number of lines you want to see kbsvbbgbgb ggpp plzlonngggg",
                "numberOfLines": 10,
                "textalignment": "center",
                "backgroundColor" : "CCDCF0",
                "padding" : 50
            ],
            [   "type" : "uiview",
                "portionCoveredPerc": 40,
                "number": 6,
                "backgroundColor" : "d3d3d3",
                "padding" : 12,
                "childrens":[
                    "vertical":[
                        [
                            "type" : "button",
                            
                            "parameter": [
                                "query" :
                                    [ "id" : "S121",
                                      "deeplink" : "kings://screendetail",
                                      "action" : "Submit"
                                ]
                            ],
                            "title" : "Bottom View 1",
                            "backgroundColor" : "4567def",
                            "number": 1,
                            "hAlign" : "Left",
                            "portionCoveredPerc": 10,
                            ],
                        [
                            "type" : "button",
                            
                            "parameter": [
                                "query" :
                                    [ "id" : "S122",
                                      "deeplink" : "kings://gameschedule",
                                      "action" : "Cancel"
                                ]
                            ],
                            "title" : "Bottom View 22",
                            "backgroundColor" : "4567def",
                            "number": 1,
                            "hAlign" : "Left",
                            "portionCoveredPerc": 10,
                            ],
                        [
                            "type" : "uiview",
                            "portionCoveredPerc": 20,
                            "number": 3,
                            "backgroundColor" : "6B8E23",
                            "autoSpreadChild" : false,
                            "padding" : 20,
                            "childrens":[
                                "horizontal":[
                                    [
                                        "type" : "button",
                                        
                                        "parameter": [
                                            "query" :
                                                [ "id" : "S121",
                                                  "deeplink" : "kings://screendetail",
                                                  "action" : "Submit"
                                            ]
                                        ],
                                        "title" : "child inside child 1",
                                        "backgroundColor" : "1E90FF",
                                        "number": 1,
                                        "hAlign" : "Left",
                                        "portionCoveredPerc": 20,
                                        ],
                                    [
                                        "type" : "button",
                                        
                                        "parameter": [
                                            "query" :
                                                [ "id" : "S122",
                                                  "deeplink" : "kings://gameschedule",
                                                  "action" : "Cancel"
                                            ]
                                        ],
                                        "title" : "child inside child 2",
                                        "backgroundColor" : "6495ED",
                                        "number": 1,
                                        "hAlign" : "Left",
                                        "portionCoveredPerc": 10,
                                        ]
                                ]
                            ]
                        ]
                    ]
                ]
            ],
            [   "type" : "uiview",
                "portionCoveredPerc": 20,
                "number": 7,
                "backgroundColor" : "191970",
                "padding" : 12,
                "childrens":[
                    "horizontal":[
                        [
                            "type" : "imageview",
                            "number": 1,
                            "url": "testImage",
                            "sideSpacing": 40
                        ]
                    ]
                ]
            ]
        ]
]

let jsonObject: [String: [[String: Any]]] =
    [ "objects" :
        [
            [
                "type" : "imageview",
                "portionCoveredPerc" : 40,
                "number": 7,
                "url": "logo.jgp",
                "sideSpacing": 40
            ],
            [   "type" : "uiview",
                "portionCoveredPerc": 30,
                "number": 2,
                "backgroundColor" : "00ffff",
                "sideSpacing": 40,
                "childrens":
                    [
                        "horizontal":[
                            [   "type" : "uiview",
                                "number": 3,
                                "backgroundColor" : "ffb6c1"
                            ],
                            [   "type" : "uiview",
                                "number": 2,
                                "backgroundColor" : "030056"
                            ],
                            [   "type" : "uiview",
                                "number": 1,
                                "backgroundColor" : "ffb6c1"
                            ],
                            [   "type" : "uiview",
                                "number": 4,
                                "backgroundColor" : "ffb6c1"
                            ]
                        ]
                ]
            ],
            [   "type" : "uiview",
                "portionCoveredPerc": 15,
                "number": 6,
                "backgroundColor" : "FF4500"
            ],
            [   "type" : "uiview",
                "portionCoveredPerc": 15,
                "number": 4,
                "backgroundColor" : "Fbde50"
            ],
            [   "type" : "uiview",
                "portionCoveredPerc": 30,
                "number": 1,
                "backgroundColor" : "00ffff",
                "childrens":
                    [
                        "vertical":[
                            [   "type" : "uiview",
                                "number": 2,
                                "backgroundColor" : "FF255D"
                                
                            ],
                            [   "type" : "uiview",
                                "number": 3,
                                "backgroundColor" : "2C255D"
                            ]
                        ]
                ]
            ],
            [
                "type" : "label",
                "number": 3,
                "text": " hey its label,kbsvbbgbgb ggpp plz set number of lines you want to see kbsvbbgbgb ggpp plz set number of lines you want to see",
                "height" : 40,
                "width" : 300,
                "numberOfLines": 4
            ],
            [
                "type" : "button",
                "number": 2,
                "text": "buttonText",
                "height" : 40,
                "width" : 80
            ]
        ]
]

