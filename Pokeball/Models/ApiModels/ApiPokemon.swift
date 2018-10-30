//
//  ApiPokemonList.swift
//  Pokeball
//
//  Created by Pavle on 25.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import ObjectMapper

class ApiPokemon: Mappable {
    
    var pokemons: [ApiPokemonList]
    var count: Int
    var next: Any
    var previous: Any
    
    required public init?(map: Map) {
        pokemons = []
        count = 0
        next = 0
        previous = 0
    }
    
    func mapping(map: Map) {
        pokemons <- map["results"]
        count <- map["count"]
        next <- map["next"]
        previous <- map["previous"]
    }
}
