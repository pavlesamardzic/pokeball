//
//  Move.swift
//  Pokeball
//
//  Created by Pavle on 30.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import ObjectMapper

class Move: Mappable {
    
    var move: String
    var versionGroupDetails: String
    
    required init?(map: Map) {
        self.move = ""
        self.versionGroupDetails = ""
    }
    
    func mapping(map: Map) {
        move <- map["name"]
        versionGroupDetails <- map["versionGroupDetails"]
    }
}

