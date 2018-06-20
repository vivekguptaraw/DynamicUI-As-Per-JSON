//
//  jsonObjectsClass.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 26/04/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import Foundation
//MARK: Caching dewmo list
let arrayImages: [String] = [
"file:///Users/vivekgupta/Desktop/Projects/DynamicUI/DynamicUI-As-Per-JSON/DynamicUIDemo/ImageDownloader/kings12.jpg",
"file:///Users/vivekgupta/Desktop/Projects/DynamicUI/DynamicUI-As-Per-JSON/DynamicUIDemo/ImageDownloader/kings12.jpg",
"file:///Users/vivekgupta/Desktop/Projects/DynamicUI/DynamicUI-As-Per-JSON/DynamicUIDemo/ImageDownloader/kings12.jpg","file:///Users/vivekgupta/Desktop/Projects/DynamicUI/DynamicUI-As-Per-JSON/DynamicUIDemo/ImageDownloader/kings12.jpg","file:///Users/vivekgupta/Desktop/Projects/DynamicUI/DynamicUI-As-Per-JSON/DynamicUIDemo/ImageDownloader/kings12.jpg","file:///Users/vivekgupta/Desktop/Projects/DynamicUI/DynamicUI-As-Per-JSON/DynamicUIDemo/ImageDownloader/kings12.jpg","file:///Users/vivekgupta/Desktop/Projects/DynamicUI/DynamicUI-As-Per-JSON/DynamicUIDemo/ImageDownloader/kings12.jpg","file:///Users/vivekgupta/Desktop/Projects/DynamicUI/DynamicUI-As-Per-JSON/DynamicUIDemo/ImageDownloader/kings12.jpg","file:///Users/vivekgupta/Desktop/Projects/DynamicUI/DynamicUI-As-Per-JSON/DynamicUIDemo/ImageDownloader/kings12.jpg","file:///Users/vivekgupta/Desktop/Projects/DynamicUI/DynamicUI-As-Per-JSON/DynamicUIDemo/ImageDownloader/kings12.jpg","file:///Users/vivekgupta/Desktop/Projects/DynamicUI/DynamicUI-As-Per-JSON/DynamicUIDemo/ImageDownloader/kings12.jpg","file:///Users/vivekgupta/Desktop/Projects/DynamicUI/DynamicUI-As-Per-JSON/DynamicUIDemo/ImageDownloader/kings12.jpg","file:///Users/vivekgupta/Desktop/Projects/DynamicUI/DynamicUI-As-Per-JSON/DynamicUIDemo/ImageDownloader/kings12.jpg","file:///Users/vivekgupta/Desktop/Projects/DynamicUI/DynamicUI-As-Per-JSON/DynamicUIDemo/ImageDownloader/kings12.jpg","file:///Users/vivekgupta/Desktop/Projects/DynamicUI/DynamicUI-As-Per-JSON/DynamicUIDemo/ImageDownloader/kings12.jpg",
]

//MARK: GameSchedule array
let jsonGameScheduleDict: [[String: Any]] =
[["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1507301975766", "gdte": "2017-10-03 02:00:00 +0000", "gcode": "20171002/SASSAC", "attendance": "-", "period": "4", "broadcast_details": " KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C0053047C9F28D8?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0011700010", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "San Antonio", "clock": "00.0", "mid": "1507442165088", "gdte": "2017-10-07 00:30:00 +0000", "gcode": "20171006/SACSAS", "attendance": "-", "period": "4", "broadcast_details": " KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/3A0052E6A1051FB6?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "TX", "league_id": "00", "game_status_state": "FINAL", "arena_name": "AT&T Center", "gid": "0011700036", "year": "2017", "game_duration": "1:56", "times_tied": 0], ["is_pp": 0, "arena_city": "Las Vegas", "clock": "00.0", "mid": "1507521543761", "gdte": "2017-10-09 01:00:00 +0000", "gcode": "20171008/SACLAL", "attendance": "13094", "period": "4", "broadcast_details": " ESPN, KHTK Sports 1140 AM", "is_tbd": 0, "arena_state": "NV", "game_status": "3", "lead_change": 0, "league_id": "00", "game_status_state": "FINAL", "arena_name": "T-Mobile Arena", "gid": "0011700043", "year": "2017", "game_duration": "2:14", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1507609682840", "gdte": "2017-10-10 02:00:00 +0000", "gcode": "20171009/PORSAC", "attendance": "-", "period": "4", "broadcast_details": " NBA TV, NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C0053047CEE2929?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0011700053", "year": "2017", "game_duration": "2:08", "times_tied": 0], ["is_pp": 0, "arena_city": "Los Angeles", "clock": "00.0", "mid": "1507870037016", "gdte": "2017-10-13 02:30:00 +0000", "gcode": "20171012/SACLAC", "attendance": "11225", "period": "4", "broadcast_details": " NBA TV, KHTK Sports 1140 AM", "is_tbd": 0, "arena_state": "CA", "game_status": "3", "lead_change": 0, "league_id": "00", "game_status_state": "FINAL", "arena_name": "Staples Center", "gid": "0011700066", "year": "2017", "game_duration": "2:06", "times_tied": 0], ["is_pp": 0, "arena_city": "Oakland", "clock": "00.0", "mid": "1507957722308", "gdte": "2017-10-14 02:30:00 +0000", "gcode": "20171013/SACGSW", "attendance": "19596", "period": "4", "broadcast_details": " KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C005309C16188B3?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "ORACLE Arena", "gid": "0011700077", "year": "2017", "game_duration": "2:05", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1508387008164", "gdte": "2017-10-19 02:00:00 +0000", "gcode": "20171018/HOUSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C005309CDAB9231?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700013", "year": "2017", "game_duration": "2:11", "times_tied": 0], ["is_pp": 0, "arena_city": "Dallas", "clock": "00.0", "mid": "1508554058378", "gdte": "2017-10-21 00:30:00 +0000", "gcode": "20171020/SACDAL", "attendance": "19273", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/0C005311F1494DFE?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "TX", "league_id": "00", "game_status_state": "FINAL", "arena_name": "American Airlines Center", "gid": "0021700024", "year": "2017", "game_duration": "2:07", "times_tied": 0], ["is_pp": 0, "arena_city": "Denver", "clock": "00.0", "mid": "1508644330188", "gdte": "2017-10-22 01:00:00 +0000", "gcode": "20171021/SACDEN", "attendance": "19520", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "is_tbd": 0, "arena_state": "CO", "game_status": "3", "lead_change": 0, "league_id": "00", "game_status_state": "FINAL", "arena_name": "Pepsi Center", "gid": "0021700035", "year": "2017", "game_duration": "2:27", "times_tied": 0], ["is_pp": 0, "arena_city": "Phoenix", "clock": "00.0", "mid": "1508819305494", "gdte": "2017-10-24 02:00:00 +0000", "gcode": "20171023/SACPHX", "attendance": "14903", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/19005309EDC745A1?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "AZ", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Talking Stick Resort Arena", "gid": "0021700048", "year": "2017", "game_duration": "2:18", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1509080928161", "gdte": "2017-10-27 02:30:00 +0000", "gcode": "20171026/NOPSAC", "attendance": "17583", "period": "4", "broadcast_details": " TNT, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C005309CF1B9326?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700069", "year": "2017", "game_duration": "2:23", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1509322168471", "gdte": "2017-10-29 22:00:00 +0000", "gcode": "20171029/WASSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C005309D01E940C?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700089", "year": "2017", "game_duration": "1:59", "times_tied": 0], ["is_pp": 0, "arena_city": "Indianapolis", "clock": "00.0", "mid": "1509499036341", "gdte": "2017-10-31 23:00:00 +0000", "gcode": "20171031/SACIND", "attendance": "12245", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/0500530E0470742C?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "IN", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Bankers Life Fieldhouse", "gid": "0021700101", "year": "2017", "game_duration": "2:02", "times_tied": 0], ["is_pp": 0, "arena_city": "Boston", "clock": "00.0", "mid": "1509586820401", "gdte": "2017-11-01 23:30:00 +0000", "gcode": "20171101/SACBOS", "attendance": "-", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/0100530EE69D5E8B?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "MA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "TD Garden", "gid": "0021700109", "year": "2017", "game_duration": "1:59", "times_tied": 0], ["is_pp": 0, "arena_city": "Detroit", "clock": "00.0", "mid": "1509844524189", "gdte": "2017-11-04 23:00:00 +0000", "gcode": "20171104/SACDET", "attendance": "17683", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/0800530F7D7B1C55?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "MI", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Little Caesars Arena", "gid": "0021700132", "year": "2017", "game_duration": "2:04", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1510118631550", "gdte": "2017-11-08 03:00:00 +0000", "gcode": "20171107/OKCSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBA TV, NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C005309D15D949C?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700158", "year": "2017", "game_duration": "2:13", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1510291784312", "gdte": "2017-11-10 03:00:00 +0000", "gcode": "20171109/PHISAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C005309D24B9532?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700167", "year": "2017", "game_duration": "2:18", "times_tied": 0], ["is_pp": 0, "arena_city": "New York", "clock": "00.0", "mid": "1510456657268", "gdte": "2017-11-12 01:00:00 +0000", "gcode": "20171111/SACNYK", "attendance": "19812", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/3B00530FF355215B?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "NY", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Madison Square Garden", "gid": "0021700179", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Washington", "clock": "00.0", "mid": "1510625301000", "gdte": "2017-11-14 00:00:00 +0000", "gcode": "20171113/SACWAS", "attendance": "14660", "period": "4", "broadcast_details": " NBA TV, NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1500530EF9883A57?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "DC", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Capital One Arena", "gid": "0021700192", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Atlanta", "clock": "00.0", "mid": "1510802629687", "gdte": "2017-11-16 00:30:00 +0000", "gcode": "20171115/SACATL", "attendance": "13860", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/0E00530FB06C7E75?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "GA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Philips Arena", "gid": "0021700204", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1510982321319", "gdte": "2017-11-18 03:00:00 +0000", "gcode": "20171117/PORSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B6DC2310B?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700225", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Portland", "clock": "00.0", "mid": "1511069088017", "gdte": "2017-11-19 03:00:00 +0000", "gcode": "20171118/SACPOR", "attendance": "19522", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/0F005310EBF89006?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "OR", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Moda Center", "gid": "0021700234", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1511241455556", "gdte": "2017-11-21 03:00:00 +0000", "gcode": "20171120/DENSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B6F1033B1?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700251", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1511416475796", "gdte": "2017-11-23 03:30:00 +0000", "gcode": "20171122/LALSAC", "attendance": "17583", "period": "4", "broadcast_details": " ESPN, NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B6FC4345F?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700266", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1511673596378", "gdte": "2017-11-26 03:00:00 +0000", "gcode": "20171125/LACSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B809B4767?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700286", "year": "2017", "game_duration": "0:52", "times_tied": 0], ["is_pp": 0, "arena_city": "Oakland", "clock": "00.0", "mid": "1511848616311", "gdte": "2017-11-28 03:30:00 +0000", "gcode": "20171127/SACGSW", "attendance": "19596", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C005309C0C787F2?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "ORACLE Arena", "gid": "0021700296", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1511932683389", "gdte": "2017-11-29 03:00:00 +0000", "gcode": "20171128/MILSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B81024848?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700302", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Chicago", "clock": "00.0", "mid": "1512184382674", "gdte": "2017-12-02 01:00:00 +0000", "gcode": "20171201/SACCHI", "attendance": "19268", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/0400530FDA0545F7?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "IL", "league_id": "00", "game_status_state": "FINAL", "arena_name": "United Center", "gid": "0021700322", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Milwaukee", "clock": "00.0", "mid": "1512273480463", "gdte": "2017-12-03 01:30:00 +0000", "gcode": "20171202/SACMIL", "attendance": "15581", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/0700532DB6762989?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "WI", "league_id": "00", "game_status_state": "FINAL", "arena_name": "BMO Harris Bradley Center", "gid": "0021700331", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Cleveland", "clock": "00.0", "mid": "1512612903982", "gdte": "2017-12-07 00:00:00 +0000", "gcode": "20171206/SACCLE", "attendance": "20562", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "is_tbd": 0, "arena_state": "OH", "game_status": "3", "lead_change": 0, "league_id": "00", "game_status_state": "FINAL", "arena_name": "Quicken Loans Arena", "gid": "0021700353", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "New Orleans", "clock": "00.0", "mid": "1512790318668", "gdte": "2017-12-09 01:00:00 +0000", "gcode": "20171208/SACNOP", "attendance": "15019", "period": "5", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1B00531F1A1CAE4C?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "LA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Smoothie King Center", "gid": "0021700373", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1512946244992", "gdte": "2017-12-10 20:30:00 +0000", "gcode": "20171210/TORSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B83304A86?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700385", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1513142066438", "gdte": "2017-12-13 03:00:00 +0000", "gcode": "20171212/PHXSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B83B94B59?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700403", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Minneapolis", "clock": "00.0", "mid": "1513307634280", "gdte": "2017-12-15 01:00:00 +0000", "gcode": "20171214/SACMIN", "attendance": "11126", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "is_tbd": 0, "arena_state": "MN", "game_status": "3", "lead_change": 0, "league_id": "00", "game_status_state": "FINAL", "arena_name": "Target Center", "gid": "0021700416", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Toronto", "clock": "00.0", "mid": "1513550925189", "gdte": "2017-12-17 20:30:00 +0000", "gcode": "20171217/SACTOR", "attendance": "19800", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1000531CFC2C90D5?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "ON", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Air Canada Centre", "gid": "0021700437", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Philadelphia", "clock": "00.0", "mid": "1513737245621", "gdte": "2017-12-20 00:00:00 +0000", "gcode": "20171219/SACPHI", "attendance": "20558", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "is_tbd": 0, "arena_state": "PA", "game_status": "3", "lead_change": 0, "league_id": "00", "game_status_state": "FINAL", "arena_name": "Wells Fargo Center", "gid": "0021700451", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Brooklyn", "clock": "00.0", "mid": "1513825268945", "gdte": "2017-12-21 00:30:00 +0000", "gcode": "20171220/SACBKN", "attendance": "13179", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/0000530AC73D6F33?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "NY", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Barclays Center", "gid": "0021700457", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1514091823645", "gdte": "2017-12-24 03:00:00 +0000", "gcode": "20171223/SASSAC", "attendance": "-", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B882F51F2?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700492", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Los Angeles", "clock": "00.0", "mid": "1514353523464", "gdte": "2017-12-27 03:30:00 +0000", "gcode": "20171226/SACLAC", "attendance": "16393", "period": "4", "broadcast_details": " NBA TV, NBCSCA, KHTK Sports 1140 AM", "is_tbd": 0, "arena_state": "CA", "game_status": "3", "lead_change": 0, "league_id": "00", "game_status_state": "FINAL", "arena_name": "Staples Center", "gid": "0021700505", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1514438271278", "gdte": "2017-12-28 03:00:00 +0000", "gcode": "20171227/CLESAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B8A8E5577?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700513", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1514611155750", "gdte": "2017-12-30 03:00:00 +0000", "gcode": "20171229/PHXSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B814C4884?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700527", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1514773322721", "gdte": "2018-01-01 00:00:00 +0000", "gcode": "20171231/MEMSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B82944A25?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700543", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1514956056524", "gdte": "2018-01-03 03:00:00 +0000", "gcode": "20180102/CHASAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B83CF4B91?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700552", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1515302395724", "gdte": "2018-01-07 03:00:00 +0000", "gcode": "20180106/DENSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B85404D9E?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700585", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1515475039250", "gdte": "2018-01-09 03:00:00 +0000", "gcode": "20180108/SASSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B83494A9A?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700596", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Los Angeles", "clock": "00.0", "mid": "1515563427575", "gdte": "2018-01-10 03:30:00 +0000", "gcode": "20180109/SACLAL", "attendance": "-", "period": "4", "broadcast_details": " NBA TV, NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/2C00530CF7BB0D1E?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Staples Center", "gid": "0021700602", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1515735241485", "gdte": "2018-01-12 03:00:00 +0000", "gcode": "20180111/LACSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B81E7494A?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700616", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Los Angeles", "clock": "00.0", "mid": "1515883930155", "gdte": "2018-01-13 20:30:00 +0000", "gcode": "20180113/SACLAC", "attendance": "16656", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "is_tbd": 0, "arena_state": "CA", "game_status": "3", "lead_change": 0, "league_id": "00", "game_status_state": "FINAL", "arena_name": "Staples Center", "gid": "0021700628", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Oklahoma City", "clock": "00.0", "mid": "1516073721891", "gdte": "2018-01-16 01:00:00 +0000", "gcode": "20180115/SACOKC", "attendance": "18203", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/0C00530EE1D53F7A?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "OK", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Chesapeake Energy Arena", "gid": "0021700643", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1516252682607", "gdte": "2018-01-18 03:00:00 +0000", "gcode": "20180117/UTASAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B84584C98?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700661", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Memphis", "clock": "00.0", "mid": "1516418009258", "gdte": "2018-01-20 01:00:00 +0000", "gcode": "20180119/SACMEM", "attendance": "16831", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1B005304EDA0C1BF?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "TN", "league_id": "00", "game_status_state": "FINAL", "arena_name": "FedExForum", "gid": "0021700670", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Charlotte", "clock": "00.0", "mid": "1516674113770", "gdte": "2018-01-23 00:00:00 +0000", "gcode": "20180122/SACCHA", "attendance": "11806", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/0E0053189F515005?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "NC", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Spectrum Center", "gid": "0021700687", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Orlando", "clock": "00.0", "mid": "1516760267891", "gdte": "2018-01-24 00:00:00 +0000", "gcode": "20180123/SACORL", "attendance": "18846", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/220052FF88547A6C?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "FL", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Amway Center", "gid": "0021700696", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Miami", "clock": "00.0", "mid": "1516935149731", "gdte": "2018-01-26 00:30:00 +0000", "gcode": "20180125/SACMIA", "attendance": "19600", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/0D00530EE2DEC3BB?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "FL", "league_id": "00", "game_status_state": "FINAL", "arena_name": "AmericanAirlines Arena", "gid": "0021700710", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "San Antonio", "clock": "00.0", "mid": "1517192123188", "gdte": "2018-01-29 00:00:00 +0000", "gcode": "20180128/SACSAS", "attendance": "18418", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/3A00531DA25C354F?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "TX", "league_id": "00", "game_status_state": "FINAL", "arena_name": "AT&T Center", "gid": "0021700737", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "New Orleans", "clock": "00.0", "mid": "1517368647407", "gdte": "2018-01-31 01:00:00 +0000", "gcode": "20180130/SACNOP", "attendance": "14292", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1B00531F1A3EAE66?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "LA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Smoothie King Center", "gid": "0021700749", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1517637246779", "gdte": "2018-02-03 03:30:00 +0000", "gcode": "20180202/GSWSAC", "attendance": "16583", "period": "4", "broadcast_details": " ESPN, NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B70593534?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700774", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1517721406710", "gdte": "2018-02-04 03:00:00 +0000", "gcode": "20180203/DALSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B84CC4D15?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700783", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1517894506920", "gdte": "2018-02-06 03:00:00 +0000", "gcode": "20180205/CHISAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B85B14E43?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700795", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1518241780549", "gdte": "2018-02-10 03:30:00 +0000", "gcode": "20180209/PORSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B86124ED5?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700825", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Minneapolis", "clock": "00.0", "mid": "1518402157185", "gdte": "2018-02-12 00:00:00 +0000", "gcode": "20180211/SACMIN", "attendance": "18068", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "is_tbd": 0, "arena_state": "MN", "game_status": "3", "lead_change": 0, "league_id": "00", "game_status_state": "FINAL", "arena_name": "Target Center", "gid": "0021700838", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Dallas", "clock": "00.0", "mid": "1518579945651", "gdte": "2018-02-14 01:30:00 +0000", "gcode": "20180213/SACDAL", "attendance": "19801", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/0C005311F17A4E39?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "TX", "league_id": "00", "game_status_state": "FINAL", "arena_name": "American Airlines Center", "gid": "0021700851", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Houston", "clock": "00.0", "mid": "1518664423646", "gdte": "2018-02-15 01:00:00 +0000", "gcode": "20180214/SACHOU", "attendance": "18055", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "is_tbd": 0, "arena_state": "TX", "game_status": "3", "lead_change": 0, "league_id": "00", "game_status_state": "FINAL", "arena_name": "Toyota Center", "gid": "0021700860", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1519438127504", "gdte": "2018-02-23 03:00:00 +0000", "gcode": "20180222/OKCSAC", "attendance": "-", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B86955039?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700871", "year": "2017", "game_duration": "4:32", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1519536404377", "gdte": "2018-02-25 03:00:00 +0000", "gcode": "20180224/LALSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B870650BA?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700891", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1519708501423", "gdte": "2018-02-27 03:00:00 +0000", "gcode": "20180226/MINSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBA TV, NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B878F514A?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700906", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Portland", "clock": "00.0", "mid": "1519796788746", "gdte": "2018-02-28 03:00:00 +0000", "gcode": "20180227/SACPOR", "attendance": "19468", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/0F005310EC619054?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "OR", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Moda Center", "gid": "0021700911", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "02:26", "mid": "1519977571364", "gdte": "2018-03-02 03:00:00 +0000", "gcode": "20180301/BKNSAC", "attendance": "-", "period": "5", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B887B523E?webview=1", "is_tbd": 0, "game_status": "2", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "1ST OT", "arena_name": "Golden 1 Center", "gid": "0021700924", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1520140772126", "gdte": "2018-03-04 03:00:00 +0000", "gcode": "20180303/UTASAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B880851DF?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700942", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1520223818405", "gdte": "2018-03-05 02:00:00 +0000", "gcode": "20180304/NYKSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "is_tbd": 0, "arena_state": "CA", "game_status": "3", "lead_change": 0, "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700949", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1520486213930", "gdte": "2018-03-08 03:00:00 +0000", "gcode": "20180307/NOPSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B8B8256AC?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700969", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1520658773654", "gdte": "2018-03-10 03:00:00 +0000", "gcode": "20180309/ORLSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B8AD255E2?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021700985", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Denver", "clock": "00.0", "mid": "1520809964039", "gdte": "2018-03-11 21:00:00 +0000", "gcode": "20180311/SACDEN", "attendance": "19520", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "is_tbd": 0, "arena_state": "CO", "game_status": "3", "lead_change": 0, "league_id": "00", "game_status_state": "FINAL", "arena_name": "Pepsi Center", "gid": "0021700996", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Oklahoma City", "clock": "00.0", "mid": "1520907495819", "gdte": "2018-03-13 00:00:00 +0000", "gcode": "20180312/SACOKC", "attendance": "18203", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/0C00530EE20F3FA6?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "OK", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Chesapeake Energy Arena", "gid": "0021701003", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1521089217343", "gdte": "2018-03-15 02:00:00 +0000", "gcode": "20180314/MIASAC", "attendance": "17583", "period": "5", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B8BE95716?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021701018", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Oakland", "clock": "00.0", "mid": "1521262144003", "gdte": "2018-03-17 02:30:00 +0000", "gcode": "20180316/SACGSW", "attendance": "19596", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C005309C13C8884?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "ORACLE Arena", "gid": "0021701033", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Salt Lake City", "clock": "00.0", "mid": "1521343959136", "gdte": "2018-03-18 01:00:00 +0000", "gcode": "20180317/SACUTA", "attendance": "18306", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1E00530488901B9D?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "UT", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Vivint Smart Home Arena", "gid": "0021701043", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1521519055239", "gdte": "2018-03-20 02:00:00 +0000", "gcode": "20180319/DETSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B8E985B30?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021701057", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1521779276712", "gdte": "2018-03-23 02:00:00 +0000", "gcode": "20180322/ATLSAC", "attendance": "-", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B8F555C72?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021701077", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1522023065484", "gdte": "2018-03-25 22:00:00 +0000", "gcode": "20180325/BOSSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B994B6A8D?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021701099", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1522211025351", "gdte": "2018-03-28 02:00:00 +0000", "gcode": "20180327/DALSAC", "attendance": "-", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B9A076B87?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021701113", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1522383741737", "gdte": "2018-03-30 02:00:00 +0000", "gcode": "20180329/INDSAC", "attendance": "-", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B8D6858D5?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021701127", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1522557595541", "gdte": "2018-04-01 02:00:00 +0000", "gcode": "20180331/GSWSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1C00530B8CBD5847?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021701142", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Los Angeles", "clock": "00.0", "mid": "1522641109303", "gdte": "2018-04-02 01:30:00 +0000", "gcode": "20180401/SACLAL", "attendance": "18997", "period": "4", "broadcast_details": " NBA TV, NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/2C00530CF8080D4A?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "CA", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Staples Center", "gid": "0021701155", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Phoenix", "clock": "00.0", "mid": "1522815838189", "gdte": "2018-04-04 02:00:00 +0000", "gcode": "20180403/SACPHX", "attendance": "16826", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "buy_tickets": "kingsapp://openurl/modal?url=http://www.ticketmaster.com/event/1900530AB8AD38E2?webview=1", "is_tbd": 0, "game_status": "3", "lead_change": 0, "arena_state": "AZ", "league_id": "00", "game_status_state": "FINAL", "arena_name": "Talking Stick Resort Arena", "gid": "0021701167", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Memphis", "clock": "00.0", "mid": "1523067780624", "gdte": "2018-04-07 00:00:00 +0000", "gcode": "20180406/SACMEM", "attendance": "16527", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "is_tbd": 0, "arena_state": "TN", "game_status": "3", "lead_change": 0, "league_id": "00", "game_status_state": "FINAL", "arena_name": "FedExForum", "gid": "0021701188", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "San Antonio", "clock": "00.0", "mid": "1523328494047", "gdte": "2018-04-10 00:30:00 +0000", "gcode": "20180409/SACSAS", "attendance": "18418", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "is_tbd": 0, "arena_state": "TX", "game_status": "3", "lead_change": 0, "league_id": "00", "game_status_state": "FINAL", "arena_name": "AT&T Center", "gid": "0021701210", "year": "2017", "game_duration": "0:00", "times_tied": 0], ["is_pp": 0, "arena_city": "Sacramento", "clock": "00.0", "mid": "1523508226457", "gdte": "2018-04-12 02:30:00 +0000", "gcode": "20180411/HOUSAC", "attendance": "17583", "period": "4", "broadcast_details": " NBCSCA, KHTK Sports 1140 AM", "is_tbd": 0, "arena_state": "CA", "game_status": "3", "lead_change": 0, "league_id": "00", "game_status_state": "FINAL", "arena_name": "Golden 1 Center", "gid": "0021701230", "year": "2017", "game_duration": "0:00", "times_tied": 0]]

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

let sectionHeaderArray: [String] = ["Avg", "3P","Avg1", "3P1","Avg2", "3P2","Avg3", "3P3","Avg4", "3P4"]
let arrayForBirectional: [String:Any ] = [
    "first":[1,2,3,4,5,6,7,8,9,10],
    "second":[2,4,5,6,7,8,9,1,2,10],
    "third":[3,2,3,4,5,6,7,8,9,10],
    "fourth":[4,4,5,6,7,8,9,1,2,10],
    "fifth":[5,2,3,4,5,6,7,8,9,10],
    "sixth":[6,4,5,6,7,8,9,1,2,10],
    "seventh":[7,2,3,4,5,6,7,8,9,10],
    "eighth":[8,4,5,6,7,8,9,1,2,10],
    "first1":[1,2,3,4,5,6,7,8,9,10],
    "second1":[2,4,5,6,7,8,9,1,2,10],
    "third1":[3,2,3,4,5,6,7,8,9,10],
    "fourth1":[4,4,5,6,7,8,9,1,2,10],
    "fifth1":[5,2,3,4,5,6,7,8,9,10],
    "sixth1":[6,4,5,6,7,8,9,1,2,10],
    "seventh1":[7,2,3,4,5,6,7,8,9,10],
    "eighth1":[8,4,5,6,7,8,9,1,2,10],
    "first2":[1,2,3,4,5,6,7,8,9,10],
    "second2":[2,4,5,6,7,8,9,1,2,10],
    "third2":[3,2,3,4,5,6,7,8,9,10],
    "fourth2":[4,4,5,6,7,8,9,1,2,10],
    "fifth2":[5,2,3,4,5,6,7,8,9,10],
    "sixth2":[6,4,5,6,7,8,9,1,2,10],
    "seventh2":[7,2,3,4,5,6,7,8,9,10],
    "eighth2":[8,4,5,6,7,8,9,1,2,10],
    "first3":[1,2,3,4,5,6,7,8,9,10],
    "second3":[2,4,5,6,7,8,9,1,2,10],
    "third3":[3,2,3,4,5,6,7,8,9,10],
    "fourth3":[4,4,5,6,7,8,9,1,2,10],
    "fifth3":[5,2,3,4,5,6,7,8,9,10],
    "sixth3":[6,4,5,6,7,8,9,1,2,10],
    "seventh3":[7,2,3,4,5,6,7,8,9,10],
    "eighth3":[8,4,5,6,7,8,9,1,2,10],
    
]


let jsonPlayByPlay2: [[String: Any]] = [["pid": 2216, "current_session": 1, "desc": "SAC - Randolph Jump Shot: Missed", "scoreDiff": -1, "locy": 248.9131317138672, "locx": 182.9880065917969, "etype": 2], ["pid": 1627741, "current_session": 1, "desc": "SAC  - Hield Layup Shot: Made (3 PTS)", "scoreDiff": 1, "locy": 276.8732299804688, "locx": 199.5480041503906, "etype": 1], ["pid": 2216, "current_session": 1, "desc": "SAC  - Randolph 3pt Shot: Made (3 PTS) Assist: G Hill (1 AST)", "scoreDiff": 4, "locy": 123.4336318969727, "locx": 280.6919860839844, "etype": 1], ["pid": 1628382, "current_session": 1, "desc": "SAC  - Jackson 3pt Shot: Made (3 PTS) Assist: Randolph (1 AST)", "scoreDiff": 7, "locy": 167.0786743164062, "locx": 58.78799819946289, "etype": 1], ["pid": 0, "current_session": 1, "desc": "TwoPoints: Made", "scoreDiff": 9, "locy": 274.8273620605469, "locx": 202.0319976806641, "etype": 1], ["pid": 0, "current_session": 1, "desc": "TwoPoints: Made", "scoreDiff": 9, "locy": 173.8982086181641, "locx": 274.89599609375, "etype": 1], ["pid": 1626161, "current_session": 1, "desc": "SAC  - Cauley-Stein Jump Shot: Made (4 PTS) Assist: Randolph (1 AST)", "scoreDiff": 11, "locy": 262.5522155761719, "locx": 202.0319976806641, "etype": 1], ["pid": 0, "current_session": 1, "desc": "TwoPoints: Missed", "scoreDiff": 11, "locy": 273.4634704589844, "locx": 176.3639984130859, "etype": 2], ["pid": 1627741, "current_session": 1, "desc": "SAC  - Hield Putback Dunk Shot: Made (5 PTS)", "scoreDiff": 13, "locy": 289.8303527832031, "locx": 207, "etype": 1], ["pid": 1628382, "current_session": 1, "desc": "SAC  - Jackson Driving Floating Jump Shot: Made (7 PTS) Assist: Randolph (2 AST)", "scoreDiff": 15, "locy": 229.8184204101562, "locx": 230.1840057373047, "etype": 1], ["pid": 0, "current_session": 1, "desc": "TwoPoints: Made", "scoreDiff": 17, "locy": 244.8214111328125, "locx": 245.9160003662109, "etype": 1], ["pid": 1626161, "current_session": 1, "desc": "SAC  - Cauley-Stein Alley Oop Dunk Shot: Made (8 PTS) Assist: Jackson (1 AST)", "scoreDiff": 19, "locy": 283.0108032226562, "locx": 214.4519958496094, "etype": 1], ["pid": 2216, "current_session": 1, "desc": "SAC - Randolph Hook Shot: Missed", "scoreDiff": 16, "locy": 266.6439208984375, "locx": 262.4760131835938, "etype": 2], ["pid": 1627741, "current_session": 1, "desc": "SAC  - Hield Step Back Jump shot: Made (7 PTS)", "scoreDiff": 16, "locy": 235.2740478515625, "locx": 290.6279907226562, "etype": 1], ["pid": 2216, "current_session": 1, "desc": "SAC - Randolph Jump Shot: Missed", "scoreDiff": 16, "locy": 143.2102966308594, "locx": 176.3639984130859, "etype": 2], ["pid": 1627741, "current_session": 1, "desc": "SAC - Hield 3pt Shot: Missed", "scoreDiff": 13, "locy": 149.3478698730469, "locx": 81.14399719238281, "etype": 2], ["pid": 201585, "current_session": 1, "desc": "SAC - Koufos Hook Shot: Missed", "scoreDiff": 11, "locy": 258.4604797363281, "locx": 221.0760040283203, "etype": 2], ["pid": 202066, "current_session": 1, "desc": "SAC - Temple 3pt Shot: Missed Block: Holiday (1 BLK)", "scoreDiff": 8, "locy": 139.8005218505859, "locx": 308.0159912109375, "etype": 2], ["pid": 201585, "current_session": 1, "desc": "SAC  - Koufos Cutting Dunk Shot: Made (2 PTS) Assist: Temple (1 AST)", "scoreDiff": 8, "locy": 276.8732299804688, "locx": 216.1080017089844, "etype": 1], ["pid": 1627746, "current_session": 1, "desc": "SAC  - Labissiere Jump Shot: Made (2 PTS) Assist: Fox (1 AST)", "scoreDiff": 10, "locy": 169.1245422363281, "locx": 289.7999877929688, "etype": 1], ["pid": 0, "current_session": 1, "desc": "ThreePoints: Made", "scoreDiff": 11, "locy": 166.3967132568359, "locx": 356.8680114746094, "etype": 1], ["pid": 1628368, "current_session": 1, "desc": "SAC - Fox Jump Shot: Missed Block: Nelson (1 BLK)", "scoreDiff": 9, "locy": 182.7636108398438, "locx": 188.7839965820312, "etype": 2], ["pid": 1628368, "current_session": 1, "desc": "SAC  - Fox Jump Shot: Made (2 PTS) Assist: Koufos (1 AST)", "scoreDiff": 11, "locy": 145.2561492919922, "locx": 212.7960052490234, "etype": 1], ["pid": 1627746, "current_session": 1, "desc": "SAC  - Labissiere Jump Shot: Made (7 PTS)", "scoreDiff": 11, "locy": 277.55517578125, "locx": 178.0200042724609, "etype": 1], ["pid": 203992, "current_session": 1, "desc": "SAC  - Bogdanovic Running Layup Shot: Made (2 PTS) Assist: Fox (3 AST)", "scoreDiff": 13, "locy": 288.4664306640625, "locx": 202.8600006103516, "etype": 1], ["pid": 1627746, "current_session": 2, "desc": "SAC - Labissiere Jump Shot: Missed", "scoreDiff": 13, "locy": 278.2371520996094, "locx": 122.5439987182617, "etype": 2], ["pid": 203992, "current_session": 2, "desc": "SAC - Bogdanovic 3pt Shot: Missed", "scoreDiff": 11, "locy": 150.7117767333984, "locx": 87.76799774169922, "etype": 2], ["pid": 202066, "current_session": 2, "desc": "SAC  - Temple Jump Shot: Made (2 PTS) Assist: Koufos (2 AST)", "scoreDiff": 13, "locy": 169.8064880371094, "locx": 202.8600006103516, "etype": 1], ["pid": 201585, "current_session": 2, "desc": "SAC - Koufos Cutting Layup Shot: Missed", "scoreDiff": 14, "locy": 277.55517578125, "locx": 234.3240051269531, "etype": 2], ["pid": 1628368, "current_session": 2, "desc": "SAC  - Fox 3pt Shot: Made (5 PTS) Assist: Temple (2 AST)", "scoreDiff": 17, "locy": 194.3568267822266, "locx": 35.60400009155273, "etype": 1], ["pid": 1628368, "current_session": 2, "desc": "SAC - Fox Floating Jump shot: Missed", "scoreDiff": 17, "locy": 234.5921020507812, "locx": 181.3320007324219, "etype": 2], ["pid": 1628368, "current_session": 2, "desc": "SAC - Fox Jump Shot: Missed", "scoreDiff": 16, "locy": 168.4425811767578, "locx": 184.6439971923828, "etype": 2], ["pid": 202066, "current_session": 2, "desc": "SAC  - Temple 3pt Shot: Made (8 PTS) Assist: Bogdanovic (2 AST)", "scoreDiff": 17, "locy": 166.3967132568359, "locx": 62.92800140380859, "etype": 1], ["pid": 1713, "current_session": 2, "desc": "SAC - Carter 3pt Shot: Missed", "scoreDiff": 15, "locy": 154.1215515136719, "locx": 337.8240051269531, "etype": 2], ["pid": 1713, "current_session": 2, "desc": "SAC  - Carter 3pt Shot: Made (3 PTS) Assist: Cauley-Stein (2 AST)", "scoreDiff": 16, "locy": 115.2501907348633, "locx": 190.4400024414062, "etype": 1], ["pid": 1628368, "current_session": 2, "desc": "SAC - Fox Jump Shot: Missed", "scoreDiff": 14, "locy": 160.9410858154297, "locx": 249.2279968261719, "etype": 2], ["pid": 202066, "current_session": 2, "desc": "SAC - Temple 3pt Shot: Missed", "scoreDiff": 14, "locy": 280.9649658203125, "locx": 16.55999946594238, "etype": 2], ["pid": 2216, "current_session": 2, "desc": "SAC - Randolph 3pt Shot: Missed", "scoreDiff": 14, "locy": 118.6599578857422, "locx": 212.7960052490234, "etype": 2], ["pid": 2216, "current_session": 2, "desc": "SAC  - Randolph Jump Shot: Made (7 PTS) Assist: Carter (1 AST)", "scoreDiff": 16, "locy": 285.0566711425781, "locx": 194.5800018310547, "etype": 1], ["pid": 0, "current_session": 2, "desc": "TwoPoints: Missed", "scoreDiff": 16, "locy": 272.0995483398438, "locx": 199.5480041503906, "etype": 2], ["pid": 1713, "current_session": 2, "desc": "SAC - Carter Step Back Jump shot: Missed", "scoreDiff": 15, "locy": 182.7636108398438, "locx": 284.0039978027344, "etype": 2], ["pid": 201588, "current_session": 2, "desc": "SAC  - G Hill Floating Jump shot: Made (4 PTS) Assist: Randolph (3 AST)", "scoreDiff": 14, "locy": 195.0387725830078, "locx": 213.6239929199219, "etype": 1], ["pid": 203992, "current_session": 2, "desc": "SAC  - Bogdanovic Reverse Layup Shot: Made (4 PTS) Assist: Cauley-Stein (3 AST)", "scoreDiff": 13, "locy": 265.9619750976562, "locx": 216.1080017089844, "etype": 1], ["pid": 201588, "current_session": 2, "desc": "SAC  - G Hill Step Back Jump shot: Made (6 PTS)", "scoreDiff": 14, "locy": 147.3020172119141, "locx": 182.1600036621094, "etype": 1], ["pid": 1626161, "current_session": 3, "desc": "SAC - Cauley-Stein Jump Shot: Missed", "scoreDiff": 14, "locy": 143.8922424316406, "locx": 170.5679931640625, "etype": 2], ["pid": 1627741, "current_session": 3, "desc": "SAC  - Hield 3pt Shot: Made (10 PTS) Assist: G Hill (4 AST)", "scoreDiff": 17, "locy": 167.7606201171875, "locx": 62.09999847412109, "etype": 1], ["pid": 1627741, "current_session": 3, "desc": "SAC  - Hield Pullup Jump shot: Made (12 PTS)", "scoreDiff": 19, "locy": 173.2162628173828, "locx": 269.1000061035156, "etype": 1], ["pid": 2216, "current_session": 3, "desc": "SAC - Randolph Jump Shot: Missed", "scoreDiff": 17, "locy": 217.5432586669922, "locx": 195.4080047607422, "etype": 2], ["pid": 1627741, "current_session": 3, "desc": "SAC - Hield Jump Shot: Missed", "scoreDiff": 15, "locy": 190.9470520019531, "locx": 118.4039993286133, "etype": 2], ["pid": 1626161, "current_session": 3, "desc": "SAC - Cauley-Stein Jump Shot: Missed", "scoreDiff": 15, "locy": 262.5522155761719, "locx": 235.9799957275391, "etype": 2], ["pid": 1627741, "current_session": 3, "desc": "SAC - Hield Jump Shot: Missed", "scoreDiff": 13, "locy": 269.3717346191406, "locx": 190.4400024414062, "etype": 2], ["pid": 1626161, "current_session": 3, "desc": "SAC - Cauley-Stein Jump Shot: Missed", "scoreDiff": 10, "locy": 158.2132720947266, "locx": 174.7079925537109, "etype": 2], ["pid": 0, "current_session": 3, "desc": "TwoPoints: Made", "scoreDiff": 10, "locy": 280.2829895019531, "locx": 218.5919952392578, "etype": 1], ["pid": 2216, "current_session": 3, "desc": "SAC  - Randolph Hook Shot: Made (13 PTS)", "scoreDiff": 9, "locy": 240.7296752929688, "locx": 202.0319976806641, "etype": 1], ["pid": 1628382, "current_session": 3, "desc": "SAC - Jackson 3pt Shot: Missed", "scoreDiff": 7, "locy": 109.1126022338867, "locx": 168.0839996337891, "etype": 2], ["pid": 1627741, "current_session": 3, "desc": "SAC - Hield 3pt Shot: Missed", "scoreDiff": 7, "locy": 272.781494140625, "locx": 17.38800048828125, "etype": 2], ["pid": 2216, "current_session": 3, "desc": "SAC - Randolph Jump Shot: Missed", "scoreDiff": 4, "locy": 222.9988861083984, "locx": 272.4119873046875, "etype": 2], ["pid": 0, "current_session": 3, "desc": "TwoPoints: Missed", "scoreDiff": 2, "locy": 152.07568359375, "locx": 152.3520050048828, "etype": 2], ["pid": 202066, "current_session": 3, "desc": "SAC - Temple 3pt Shot: Missed", "scoreDiff": 2, "locy": 251.6409454345703, "locx": 16.55999946594238, "etype": 2], ["pid": 1628368, "current_session": 3, "desc": "SAC  - Fox Driving Layup Shot: Made (7 PTS)", "scoreDiff": 0, "locy": 283.6927795410156, "locx": 188.7839965820312, "etype": 1], ["pid": 0, "current_session": 3, "desc": "ThreePoints: Missed", "scoreDiff": 0, "locy": 147.3020172119141, "locx": 332.0280151367188, "etype": 2], ["pid": 201585, "current_session": 3, "desc": "SAC  - Koufos Cutting Finger Roll Layup Shot: Made (5 PTS) Assist: Fox (4 AST)", "scoreDiff": -1, "locy": 273.4634704589844, "locx": 192.9239959716797, "etype": 1], ["pid": 1628368, "current_session": 3, "desc": "SAC - Fox Jump Shot: Missed", "scoreDiff": -1, "locy": 143.8922424316406, "locx": 129.9960021972656, "etype": 2], ["pid": 1628368, "current_session": 4, "desc": "SAC - Fox Jump Shot: Missed", "scoreDiff": -1, "locy": 189.5831451416016, "locx": 90.25199890136719, "etype": 2], ["pid": 1628368, "current_session": 4, "desc": "SAC  - Fox Cutting Layup Shot: Made (12 PTS) Assist: Bogdanovic (3 AST)", "scoreDiff": -1, "locy": 282.328857421875, "locx": 184.6439971923828, "etype": 1], ["pid": 0, "current_session": 4, "desc": "TwoPoints: Missed", "scoreDiff": -3, "locy": 188.9011993408203, "locx": 168.0839996337891, "etype": 2], ["pid": 203992, "current_session": 4, "desc": "SAC - Bogdanovic 3pt Shot: Missed", "scoreDiff": -5, "locy": 175.2621154785156, "locx": 364.3200073242188, "etype": 2], ["pid": 201585, "current_session": 4, "desc": "SAC  - Koufos Jump Shot: Made (7 PTS) Assist: Bogdanovic (4 AST)", "scoreDiff": -5, "locy": 282.328857421875, "locx": 192.0959930419922, "etype": 1], ["pid": 0, "current_session": 4, "desc": "TwoPoints: Made", "scoreDiff": -4, "locy": 275.5093383789062, "locx": 207, "etype": 1], ["pid": 202066, "current_session": 4, "desc": "SAC - Temple 3pt Shot: Missed", "scoreDiff": -4, "locy": 165.0328063964844, "locx": 61.27199935913086, "etype": 2], ["pid": 1627746, "current_session": 4, "desc": "SAC  - Labissiere Turnaround Fadeaway shot: Made (11 PTS)", "scoreDiff": -3, "locy": 194.3568267822266, "locx": 237.6360015869141, "etype": 1], ["pid": 201585, "current_session": 4, "desc": "SAC - Koufos Reverse Layup Shot: Missed", "scoreDiff": -3, "locy": 279.6010437011719, "locx": 188.7839965820312, "etype": 2], ["pid": 203992, "current_session": 4, "desc": "SAC  - Bogdanovic Jump Shot: Made (10 PTS)", "scoreDiff": -1, "locy": 169.8064880371094, "locx": 332.8559875488281, "etype": 1], ["pid": 202066, "current_session": 4, "desc": "SAC - Temple 3pt Shot: Missed", "scoreDiff": -2, "locy": 268.6897888183594, "locx": 22.35600090026855, "etype": 2], ["pid": 201588, "current_session": 4, "desc": "SAC - G Hill Floating Jump shot: Missed", "scoreDiff": -3, "locy": 198.4485473632812, "locx": 193.7519989013672, "etype": 2], ["pid": 1626161, "current_session": 4, "desc": "SAC  - Cauley-Stein Jump Shot: Made (10 PTS) Assist: G Hill (5 AST)", "scoreDiff": -1, "locy": 171.8523559570312, "locx": 249.2279968261719, "etype": 1], ["pid": 1626161, "current_session": 4, "desc": "SAC  - Cauley-Stein Alley Oop Layup shot: Made (12 PTS) Assist: Fox (5 AST)", "scoreDiff": 1, "locy": 272.781494140625, "locx": 205.343994140625, "etype": 1], ["pid": 1628368, "current_session": 4, "desc": "SAC - Fox Jump Shot: Missed", "scoreDiff": -2, "locy": 229.136474609375, "locx": 206.1719970703125, "etype": 2], ["pid": 1628368, "current_session": 4, "desc": "SAC - Fox Pullup Jump shot: Missed", "scoreDiff": -4, "locy": 233.9101409912109, "locx": 61.27199935913086, "etype": 2], ["pid": 203992, "current_session": 4, "desc": "SAC - Bogdanovic Jump Shot: Missed", "scoreDiff": -6, "locy": 162.3049926757812, "locx": 127.5120010375977, "etype": 2], ["pid": 1626161, "current_session": 4, "desc": "SAC - Cauley-Stein Hook Shot: Missed", "scoreDiff": -8, "locy": 244.8214111328125, "locx": 155.6640014648438, "etype": 2]]

let jsonPlayByPlay1: [[String: Any]] =
    [["pid": 202326, "current_session": 1, "desc": "NOP  - Cousins Cutting Dunk Shot: Made (2 PTS) Assist: Holiday (1 AST)", "scoreDiff": -2, "locy": 274.8273620605469, "locx": 201.2039947509766, "etype": 1], ["pid": 202326, "current_session": 1, "desc": "NOP - Cousins Jump Shot: Missed Block: Randolph (1 BLK)", "scoreDiff": -1, "locy": 247.5492248535156, "locx": 193.7519989013672, "etype": 2], ["pid": 202326, "current_session": 1, "desc": "NOP - Cousins 3pt Shot: Missed", "scoreDiff": 1, "locy": 126.8433990478516, "locx": 112.6080017089844, "etype": 2], ["pid": 203121, "current_session": 1, "desc": "NOP - Miller 3pt Shot: Missed", "scoreDiff": 4, "locy": 249.5950775146484, "locx": 389.1600036621094, "etype": 2], ["pid": 202734, "current_session": 1, "desc": "NOP - Moore Jump Shot: Missed", "scoreDiff": 9, "locy": 272.781494140625, "locx": 240.947998046875, "etype": 2], ["pid": 201950, "current_session": 1, "desc": "NOP  - Holiday Driving Reverse Layup Shot: Made (2 PTS)", "scoreDiff": 7, "locy": 280.9649658203125, "locx": 219.4199981689453, "etype": 1], ["pid": 201950, "current_session": 1, "desc": "NOP - Holiday Jump Shot: Missed", "scoreDiff": 9, "locy": 180.0357971191406, "locx": 279.0360107421875, "etype": 2], ["pid": 202734, "current_session": 1, "desc": "NOP - Moore 3pt Shot: Missed", "scoreDiff": 11, "locy": 150.0298309326172, "locx": 82.80000305175781, "etype": 2], ["pid": 202326, "current_session": 1, "desc": "NOP - Cousins Jump Shot: Missed", "scoreDiff": 13, "locy": 250.2770385742188, "locx": 175.5359954833984, "etype": 2], ["pid": 202326, "current_session": 1, "desc": "NOP  - Cousins Jump Shot: Made (4 PTS)", "scoreDiff": 11, "locy": 260.50634765625, "locx": 207, "etype": 1], ["pid": 201950, "current_session": 1, "desc": "NOP - Holiday Layup Shot: Missed", "scoreDiff": 15, "locy": 271.4176025390625, "locx": 228.5279998779297, "etype": 2], ["pid": 201967, "current_session": 1, "desc": "NOP - Cunningham 3pt Shot: Missed", "scoreDiff": 15, "locy": 272.781494140625, "locx": 19.87199974060059, "etype": 2], ["pid": 2749, "current_session": 1, "desc": "NOP  - Nelson 3pt Shot: Made (3 PTS) Assist: Cousins (1 AST)", "scoreDiff": 16, "locy": 261.1882934570312, "locx": 16.55999946594238, "etype": 1], ["pid": 202326, "current_session": 1, "desc": "NOP  - Cousins Driving Layup Shot: Made (6 PTS) Assist: Nelson (1 AST)", "scoreDiff": 14, "locy": 275.5093383789062, "locx": 178.0200042724609, "etype": 1], ["pid": 2749, "current_session": 1, "desc": "NOP  - Nelson 3pt Shot: Made (6 PTS) Assist: Holiday (2 AST)", "scoreDiff": 13, "locy": 133.6629333496094, "locx": 112.6080017089844, "etype": 1], ["pid": 1627767, "current_session": 1, "desc": "NOP  - Diallo Cutting Dunk Shot: Made (2 PTS) Assist: Nelson (2 AST)", "scoreDiff": 11, "locy": 280.9649658203125, "locx": 211.9680023193359, "etype": 1], ["pid": 2749, "current_session": 1, "desc": "NOP  - Nelson 3pt Shot: Made (9 PTS) Assist: Holiday (3 AST)", "scoreDiff": 8, "locy": 145.9381103515625, "locx": 332.8559875488281, "etype": 1], ["pid": 201950, "current_session": 1, "desc": "NOP  - Holiday Driving Layup Shot: Made (4 PTS)", "scoreDiff": 6, "locy": 272.0995483398438, "locx": 187.1280059814453, "etype": 1], ["pid": 201950, "current_session": 1, "desc": "NOP - Holiday 3pt Shot: Missed", "scoreDiff": 8, "locy": 241.4116363525391, "locx": 22.35600090026855, "etype": 2], ["pid": 2754, "current_session": 1, "desc": "NOP - Allen Jump Shot: Missed Block: Labissiere (1 BLK)", "scoreDiff": 10, "locy": 263.9161071777344, "locx": 170.5679931640625, "etype": 2], ["pid": 1627767, "current_session": 1, "desc": "NOP  - Diallo Dunk Shot: Made (4 PTS)", "scoreDiff": 8, "locy": 235.2740478515625, "locx": 197.0639953613281, "etype": 1], ["pid": 2749, "current_session": 1, "desc": "NOP  - Nelson Driving Layup Shot: Made (11 PTS) Assist: Cousins (2 AST)", "scoreDiff": 9, "locy": 289.1484069824219, "locx": 211.9680023193359, "etype": 1], ["pid": 0, "current_session": 1, "desc": "TwoPoints: Missed", "scoreDiff": 11, "locy": 268.0078430175781, "locx": 220.2480010986328, "etype": 2], ["pid": 202326, "current_session": 1, "desc": "NOP  - Cousins Putback Layup Shot: Made (8 PTS)", "scoreDiff": 9, "locy": 246.8672637939453, "locx": 211.9680023193359, "etype": 1], ["pid": 1627767, "current_session": 1, "desc": "NOP - Diallo Jump Shot: Missed", "scoreDiff": 11, "locy": 274.8273620605469, "locx": 191.2680053710938, "etype": 2], ["pid": 202326, "current_session": 1, "desc": "NOP - Cousins Tip Layup Shot: Missed", "scoreDiff": 11, "locy": 289.8303527832031, "locx": 207, "etype": 2], ["pid": 2749, "current_session": 1, "desc": "NOP - Nelson 3pt Shot: Missed", "scoreDiff": 13, "locy": 122.0697250366211, "locx": 280.6919860839844, "etype": 2], ["pid": 0, "current_session": 2, "desc": "TwoPoints: Missed", "scoreDiff": 13, "locy": 242.7755432128906, "locx": 191.2680053710938, "etype": 2], ["pid": 202326, "current_session": 2, "desc": "NOP - Cousins Jump Shot: Missed", "scoreDiff": 13, "locy": 274.8273620605469, "locx": 200.3760070800781, "etype": 2], ["pid": 202326, "current_session": 2, "desc": "NOP  - Cousins Tip Layup Shot: Made (10 PTS)", "scoreDiff": 11, "locy": 289.8303527832031, "locx": 207, "etype": 1], ["pid": 202326, "current_session": 2, "desc": "NOP - Cousins 3pt Shot: Missed", "scoreDiff": 11, "locy": 104.3389282226562, "locx": 208.656005859375, "etype": 2], ["pid": 203546, "current_session": 2, "desc": "NOP - Clark Jump Shot: Missed Block: Labissiere (2 BLK)", "scoreDiff": 17, "locy": 243.4574890136719, "locx": 202.0319976806641, "etype": 2], ["pid": 202326, "current_session": 2, "desc": "NOP - Cousins Driving Layup Shot: Missed", "scoreDiff": 17, "locy": 261.8702392578125, "locx": 219.4199981689453, "etype": 2], ["pid": 201950, "current_session": 2, "desc": "NOP  - Holiday Floating Jump shot: Made (6 PTS)", "scoreDiff": 16, "locy": 231.8642883300781, "locx": 142.4160003662109, "etype": 1], ["pid": 202326, "current_session": 2, "desc": "NOP  - Cousins Reverse Layup Shot: Made (13 PTS) Assist: Moore (1 AST)", "scoreDiff": 14, "locy": 278.9190979003906, "locx": 184.6439971923828, "etype": 1], ["pid": 202734, "current_session": 2, "desc": "NOP  - Moore Alley Oop Layup shot: Made (2 PTS) Assist: Holiday (4 AST)", "scoreDiff": 15, "locy": 282.328857421875, "locx": 192.0959930419922, "etype": 1], ["pid": 202734, "current_session": 2, "desc": "NOP  - Moore Driving Layup Shot: Made (4 PTS) Assist: Cousins (3 AST)", "scoreDiff": 13, "locy": 278.9190979003906, "locx": 184.6439971923828, "etype": 1], ["pid": 202734, "current_session": 2, "desc": "NOP - Moore Jump Shot: Missed", "scoreDiff": 14, "locy": 242.7755432128906, "locx": 208.656005859375, "etype": 2], ["pid": 201967, "current_session": 2, "desc": "NOP - Cunningham Tip Layup Shot: Missed", "scoreDiff": 14, "locy": 289.8303527832031, "locx": 207, "etype": 2], ["pid": 201950, "current_session": 2, "desc": "NOP - Holiday Jump Shot: Missed Block: Temple (1 BLK)", "scoreDiff": 15, "locy": 236.6379547119141, "locx": 197.8919982910156, "etype": 2], ["pid": 202734, "current_session": 2, "desc": "NOP - Moore 3pt Shot: Missed", "scoreDiff": 14, "locy": 139.1185760498047, "locx": 101.8440017700195, "etype": 2], ["pid": 201967, "current_session": 2, "desc": "NOP - Cunningham 3pt Shot: Missed", "scoreDiff": 16, "locy": 235.2740478515625, "locx": 394.1279907226562, "etype": 2], ["pid": 202326, "current_session": 2, "desc": "NOP  - Cousins 3pt Shot: Made (17 PTS) Assist: Holiday (5 AST)", "scoreDiff": 13, "locy": 160.9410858154297, "locx": 355.2120056152344, "etype": 1], ["pid": 202734, "current_session": 2, "desc": "NOP  - Moore Jump Shot: Made (6 PTS) Assist: Nelson (3 AST)", "scoreDiff": 13, "locy": 247.5492248535156, "locx": 211.1399993896484, "etype": 1], ["pid": 201967, "current_session": 2, "desc": "NOP  - Cunningham 3pt Shot: Made (3 PTS) Assist: Cousins (4 AST)", "scoreDiff": 12, "locy": 113.8862762451172, "locx": 190.4400024414062, "etype": 1], ["pid": 202734, "current_session": 2, "desc": "NOP  - Moore 3pt Shot: Made (9 PTS) Assist: Cousins (5 AST)", "scoreDiff": 11, "locy": 264.5980529785156, "locx": 394.1279907226562, "etype": 1], ["pid": 202734, "current_session": 2, "desc": "NOP - Moore Jump Shot: Missed", "scoreDiff": 11, "locy": 176.6260223388672, "locx": 88.59600067138672, "etype": 2], ["pid": 202326, "current_session": 2, "desc": "NOP  - Cousins 3pt Shot: Made (20 PTS) Assist: Holiday (6 AST)", "scoreDiff": 10, "locy": 192.992919921875, "locx": 376.739990234375, "etype": 1], ["pid": 2749, "current_session": 2, "desc": "NOP - Nelson 3pt Shot: Missed", "scoreDiff": 14, "locy": 98.20133972167969, "locx": 178.8480072021484, "etype": 2], ["pid": 201967, "current_session": 3, "desc": "NOP - Cunningham 3pt Shot: Missed", "scoreDiff": 14, "locy": 265.280029296875, "locx": 396.6119995117188, "etype": 2], ["pid": 201967, "current_session": 3, "desc": "NOP - Cunningham 3pt Shot: Missed", "scoreDiff": 17, "locy": 287.7844848632812, "locx": 14.07600021362305, "etype": 2], ["pid": 202326, "current_session": 3, "desc": "NOP  - Cousins Driving Layup Shot: Made (22 PTS)", "scoreDiff": 17, "locy": 280.9649658203125, "locx": 225.2160034179688, "etype": 1], ["pid": 201950, "current_session": 3, "desc": "NOP  - Holiday Turnaround Fadeaway shot: Made (8 PTS)", "scoreDiff": 15, "locy": 212.7695770263672, "locx": 240.1199951171875, "etype": 1], ["pid": 201950, "current_session": 3, "desc": "NOP - Holiday 3pt Shot: Missed", "scoreDiff": 15, "locy": 129.5712127685547, "locx": 129.9960021972656, "etype": 2], ["pid": 202326, "current_session": 3, "desc": "NOP  - Cousins Jump Shot: Made (24 PTS)", "scoreDiff": 13, "locy": 238.0018615722656, "locx": 195.4080047607422, "etype": 1], ["pid": 201950, "current_session": 3, "desc": "NOP  - Holiday 3pt Shot: Made (11 PTS) Assist: Cunningham (1 AST)", "scoreDiff": 10, "locy": 137.7546691894531, "locx": 315.4679870605469, "etype": 1], ["pid": 0, "current_session": 3, "desc": "TwoPoints: Made", "scoreDiff": 8, "locy": 267.3258666992188, "locx": 221.0760040283203, "etype": 1], ["pid": 201967, "current_session": 3, "desc": "NOP  - Cunningham 3pt Shot: Made (6 PTS) Assist: Nelson (4 AST)", "scoreDiff": 7, "locy": 260.50634765625, "locx": 22.35600090026855, "etype": 1], ["pid": 202326, "current_session": 3, "desc": "NOP  - Cousins Pullup Jump shot: Made (26 PTS)", "scoreDiff": 7, "locy": 188.9011993408203, "locx": 116.7480010986328, "etype": 1], ["pid": 2749, "current_session": 3, "desc": "NOP - Nelson 3pt Shot: Missed", "scoreDiff": 7, "locy": 143.8922424316406, "locx": 99.36000061035156, "etype": 2], ["pid": 202734, "current_session": 3, "desc": "NOP - Moore 3pt Shot: Missed", "scoreDiff": 7, "locy": 272.0995483398438, "locx": 19.04400062561035, "etype": 2], ["pid": 201950, "current_session": 3, "desc": "NOP  - Holiday Driving Layup Shot: Made (14 PTS)", "scoreDiff": 4, "locy": 265.9619750976562, "locx": 203.6880035400391, "etype": 1], ["pid": 203546, "current_session": 3, "desc": "NOP  - Clark Floating Jump shot: Made (5 PTS)", "scoreDiff": 2, "locy": 275.5093383789062, "locx": 131.6519927978516, "etype": 1], ["pid": 201950, "current_session": 3, "desc": "NOP  - Holiday 3pt Shot: Made (17 PTS)", "scoreDiff": -1, "locy": 191.6290130615234, "locx": 380.052001953125, "etype": 1], ["pid": 2754, "current_session": 3, "desc": "NOP  - Allen Driving Layup Shot: Made (2 PTS)", "scoreDiff": -2, "locy": 283.6927795410156, "locx": 198.7200012207031, "etype": 1], ["pid": 203546, "current_session": 3, "desc": "NOP - Clark 3pt Shot: Missed", "scoreDiff": 0, "locy": 130.253173828125, "locx": 283.1759948730469, "etype": 2], ["pid": 2749, "current_session": 3, "desc": "NOP  - Nelson 3pt Shot: Made (16 PTS)", "scoreDiff": -3, "locy": 154.1215515136719, "locx": 82.80000305175781, "etype": 1], ["pid": 2754, "current_session": 3, "desc": "NOP - Allen 3pt Shot: Missed", "scoreDiff": 1, "locy": 285.0566711425781, "locx": 398.2680053710938, "etype": 2], ["pid": 2754, "current_session": 3, "desc": "NOP  - Allen Running Layup Shot: Made (4 PTS)", "scoreDiff": -1, "locy": 272.781494140625, "locx": 216.1080017089844, "etype": 1], ["pid": 203546, "current_session": 4, "desc": "NOP - Clark 3pt Shot: Missed", "scoreDiff": -1, "locy": 278.2371520996094, "locx": 395.7839965820312, "etype": 2], ["pid": 2754, "current_session": 4, "desc": "NOP - Allen Jump Shot: Missed", "scoreDiff": -1, "locy": 184.8094787597656, "locx": 335.3399963378906, "etype": 2], ["pid": 2754, "current_session": 4, "desc": "NOP  - Allen Reverse Layup Shot: Made (6 PTS) Assist: Nelson (5 AST)", "scoreDiff": -3, "locy": 280.9649658203125, "locx": 194.5800018310547, "etype": 1], ["pid": 0, "current_session": 4, "desc": "TwoPoints: Missed", "scoreDiff": -1, "locy": 276.1912841796875, "locx": 223.5599975585938, "etype": 2], ["pid": 2749, "current_session": 4, "desc": "NOP  - Nelson Jump Shot: Made (18 PTS)", "scoreDiff": -5, "locy": 180.0357971191406, "locx": 81.14399719238281, "etype": 1], ["pid": 2749, "current_session": 4, "desc": "NOP - Nelson Jump Shot: Missed", "scoreDiff": -5, "locy": 231.1823272705078, "locx": 200.3760070800781, "etype": 2], ["pid": 203546, "current_session": 4, "desc": "NOP  - Clark Driving Finger Roll Layup Shot: Made (7 PTS) Assist: Cousins (6 AST)", "scoreDiff": -6, "locy": 273.4634704589844, "locx": 207, "etype": 1], ["pid": 202734, "current_session": 4, "desc": "NOP - Moore Jump Shot: Missed", "scoreDiff": -4, "locy": 233.2281951904297, "locx": 186.3000030517578, "etype": 2], ["pid": 201950, "current_session": 4, "desc": "NOP - Holiday Fadeaway Jump Shot: Missed", "scoreDiff": -3, "locy": 299.3777160644531, "locx": 87.76799774169922, "etype": 2], ["pid": 2749, "current_session": 4, "desc": "NOP - Nelson Jump Shot: Missed", "scoreDiff": -3, "locy": 258.4604797363281, "locx": 226.0440063476562, "etype": 2], ["pid": 2749, "current_session": 4, "desc": "NOP - Nelson 3pt Shot: Missed", "scoreDiff": -2, "locy": 122.0697250366211, "locx": 264.9599914550781, "etype": 2], ["pid": 202734, "current_session": 4, "desc": "NOP  - Moore 3pt Shot: Made (12 PTS) Assist: Clark (1 AST)", "scoreDiff": -3, "locy": 276.1912841796875, "locx": 16.55999946594238, "etype": 1], ["pid": 202326, "current_session": 4, "desc": "NOP - Cousins Layup Shot: Missed", "scoreDiff": -1, "locy": 265.280029296875, "locx": 226.0440063476562, "etype": 2], ["pid": 202326, "current_session": 4, "desc": "NOP  - Cousins 3pt Shot: Made (37 PTS) Assist: Holiday (7 AST)", "scoreDiff": -2, "locy": 122.7516784667969, "locx": 151.5240020751953, "etype": 1], ["pid": 202326, "current_session": 4, "desc": "NOP  - Cousins Jump Shot: Made (39 PTS) Assist: Nelson (6 AST)", "scoreDiff": -6, "locy": 280.2829895019531, "locx": 209.4839935302734, "etype": 1], ["pid": 202326, "current_session": 4, "desc": "NOP - Cousins Layup Shot: Missed", "scoreDiff": -6, "locy": 273.4634704589844, "locx": 220.2480010986328, "etype": 2], ["pid": 202326, "current_session": 4, "desc": "NOP  - Cousins Tip Layup Shot: Made (41 PTS)", "scoreDiff": -8, "locy": 289.8303527832031, "locx": 207, "etype": 1]]

