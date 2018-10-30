//
//  PokemonDetailsManager.swift
//  Pokeball
//
//  Created by Pavle on 30.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import RealmSwift

class PokemonDetailsManager {
    
    func getPokemonDetails(url: String, success: @escaping (PokemonDetails)->(), failure: @escaping (Error)->()){
        PokemonDetailsService(config: BaseConfiguration.shared).getPokemonDetails(url: url, succeededRequest: success, failedRequest: failure)
    }    
}
