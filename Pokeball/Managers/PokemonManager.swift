//
//  PokemonManager.swift
//  Pokeball
//
//  Created by Pavle on 25.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import RealmSwift

class PokemonManager {
    
    func getAllPokemons(requestSucceeded: @escaping (ApiPokemon) -> Void, requestFailed: @escaping (Error) -> Void) {
        let networkService = PokemonService(config: BaseConfiguration.shared)
        networkService.getPokemons(completion: {(transactions, error) in
            if let error = error {
                requestFailed(error)
            } else {
                requestSucceeded(transactions)
            }
        })
    }
}
