//
//  TypeElement.swift
//  Pokeball
//
//  Created by Pavle on 30.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import ObjectMapper

class TypeElement: Mappable {
    
    var slot: Int
    var type: Species
    
    required init?(map: Map) {
        self.slot = 0
        self.type = Species(map: map)!
    }
    
    init?() {
        self.slot = 0
        self.type = Species()!
    }
    
    func mapping(map: Map) {
        slot <- map["slot"]
        type <- map["type"]
    }
}
