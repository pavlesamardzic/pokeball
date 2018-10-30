//
//  Species.swift
//  Pokeball
//
//  Created by Pavle on 30.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import ObjectMapper

class Species: Mappable {
    
    var name: String
    var url: String
    
    required init?(map: Map) {
        self.name = ""
        self.url = ""
    }
    
    init?() {
        self.name = ""
        self.url = ""
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        url <- map["url"]
    }
}
