//
//  PokemonListViewModel.swift
//  Pokeball
//
//  Created by Pavle on 24.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import UIKit

protocol PokemonListViewProtocol: class {
    func refreshTableView()
    func showPopup(title: String, message: String)
    
    func transitionToDetails()
}

class PokemonListViewModel {
    weak var output: PokemonListViewProtocol?
    var pokemonList: Array = Array<ApiPokemonList>()
    
    init() {}
    
    func getData() {
        let pokemonManager: PokemonManager = PokemonManager()
        
        let succeededHandler: (ApiPokemon) -> Void = { (data) in
            self.pokemonList = data.pokemons
            self.output?.refreshTableView()
        }
        
        let failedHandler: (Error) -> Void = { (error) in
            print("Error " + error.localizedDescription)
            self.output?.showPopup(title: "Error", message: error.localizedDescription)
        }
        pokemonManager.getAllPokemons(requestSucceeded: succeededHandler, requestFailed: failedHandler)
    }
}
