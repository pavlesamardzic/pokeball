//
//  Ability.swift
//  Pokeball
//
//  Created by Pavle on 30.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import ObjectMapper

class Ability: Mappable {
    var ability: Species
    var isHidden: Bool
    var slot: Int
    
     func mapping(map: Map) {
        ability <- map["ability"]
        isHidden <- map["is_hidden"]
        slot <- map["slot"]
    }
    
    required init(map: Map) {
        self.ability = Species(map: map)!
        self.isHidden = false
        self.slot = 0
    }
}
