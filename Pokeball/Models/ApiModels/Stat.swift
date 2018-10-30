//
//  Stat.swift
//  Pokeball
//
//  Created by Pavle on 30.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import ObjectMapper

class Stat: Mappable {
    
    var baseStat: Int
    var stat: String
    
    required init?(map: Map) {
        self.baseStat = 0
        self.stat = ""
    }
    
    func mapping(map: Map) {
        baseStat <- map["baseStat"]
        stat <- map["stat"]
    }
}
