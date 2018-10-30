//
//  ApiPokemon.swift
//  Pokeball
//
//  Created by Pavle on 24.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import ObjectMapper

class ApiPokemonList: Mappable {
    var name: String = ""
    var url: String = ""
    
    
    required public init?(map: Map) {}
    required public init?() {}
    
    func mapping(map: Map) {
        name <- map["name"]
        url <- map["url"]
    }
}
