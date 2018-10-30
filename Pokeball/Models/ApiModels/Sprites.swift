//
//  Sprites.swift
//  Pokeball
//
//  Created by Pavle on 30.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import ObjectMapper

class Sprites: Mappable {
    var backDefault: String
    var backFemale: String
    var backShiny: String
    var backShinyFemale: String
    var frontDefault: String
    var frontFemale: String
    var frontShiny: String
    var frontShinyFemale: String
    
    init?() {
        self.backDefault = ""
        self.backFemale = ""
        self.backShiny = ""
        self.backShinyFemale = ""
        self.frontDefault = ""
        self.frontFemale = ""
        self.frontShiny = ""
        self.frontShinyFemale = ""
    }
    
    required init?(map: Map) {
        self.backDefault = ""
        self.backFemale = ""
        self.backShiny = ""
        self.backShinyFemale = ""
        self.frontDefault = ""
        self.frontFemale = ""
        self.frontShiny = ""
        self.frontShinyFemale = ""
    }
    
    func mapping(map: Map) {
        backDefault <- map["back_default"]
        backFemale <- map["back_female"]
        backShiny <- map["back_shiny"]
        backShinyFemale <- map["back_shiny_female"]
        frontDefault <- map["front_default"]
        frontFemale <- map["front_female"]
        frontShiny <- map["front_shiny"]
        frontShinyFemale <- map["front_shiny_female"]
        
    }
}
