//
//  GameIndex.swift
//  Pokeball
//
//  Created by Pavle on 30.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import ObjectMapper

class GameIndex: Mappable {
    
    var gameIndex: String
    var version: String
    
    required init?(map: Map) {
        self.gameIndex = ""
        self.version = ""
    }
    
    func mapping(map: Map) {
        gameIndex <- map["gameIndex"]
        version <- map["version"]
    }
}
