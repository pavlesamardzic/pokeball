//
//  PokemonDetails.swift
//  Pokeball
//
//  Created by Pavle on 30.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import ObjectMapper

class PokemonDetails : Mappable {

    var abilities: [Ability]
    var baseExperience: Int
    var forms: [Species]
    var gameIndices: [GameIndex]
    var height: Int
    var heldItems: [Any]
    var id: Int
    var isDefault: Bool
    var locationAreaEncounters: String
    var moves: [Move]
    var name: String
    var order: Int
    var species: Species
    var sprites: Sprites
    var stats: [Stat]
    var types: [TypeElement]
    var weight: Int
    var url: String
    
    init?() {
        abilities = []
        baseExperience = 0
        forms = []
        gameIndices = []
        height = 0
        heldItems = []
        id = 0
        isDefault = false
        locationAreaEncounters = " "
        moves = []
        name = " "
        order = 0
        species = Species()!
        sprites = Sprites()!
        stats = []
        types = []
        weight = 0
        url = ""
    }

    
    required init?(map: Map) {
        abilities = []
        baseExperience = 0
        forms = []
        gameIndices = []
        height = 0
        heldItems = []
        id = 0
        isDefault = false
        locationAreaEncounters = " "
        moves = []
        name = " "
        order = 0
        species = Species(map: map)!
        sprites = Sprites(map: map)!
        stats = []
        types = []
        weight = 0
        url = ""
    }
    
    
    func mapping(map: Map) {
        abilities <- map["abilities"]
        baseExperience <- map["base_experience"]
        forms <- map["forms"]
        gameIndices <- map["game_indices"]
        height <- map["height"]
        heldItems <- map["held_items"]
        id <- map["id"]
        isDefault <- map["isDefault"]
        locationAreaEncounters <- map["location_area_encounters"]
        moves <- map["moves"]
        order <- map["order"]
        species <- map["species"]
        sprites <- map["sprites"]
        stats <- map["stats"]
        types <- map["types"]
        weight <- map["weight"]
        name <- map["name"]
    }
}
