//
//  PokemonDetailsViewModel
//  Pokeball
//
//  Created by Pavle on 24.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation

protocol PokemonDetailsProtocol: class {
    func updatePokeData(myPokemon: PokemonDetails)
}

class PokemonDetailsViewModel {
    
    weak var output: PokemonDetailsProtocol? = nil
    var myPokemon: (PokemonDetails)? = nil
    var passedUrl: String = ""
    var isFav: Bool = false
    var dbPokemon: Pokemone? = nil
    
    func getData(url: String) {
        let pokemonSuccess: (PokemonDetails) -> Void = { (pokemon) in
            self.myPokemon = pokemon
            self.myPokemon!.url = self.passedUrl
            self.output?.updatePokeData(myPokemon: pokemon)
        }
        
        let pokemonError: (Error) -> Void = {(error) in}
        PokemonDetailsManager().getPokemonDetails(url: url, success: pokemonSuccess, failure: pokemonError)
    }
    
    func remapDbModelToApiModel(){
        let pokemonDetails: PokemonDetails? = PokemonDetails()
        pokemonDetails!.name = (dbPokemon?.name)!
        pokemonDetails!.sprites.frontDefault = (dbPokemon?.imageUrl)!
        pokemonDetails?.baseExperience = (dbPokemon?.experience)!
        pokemonDetails!.weight = (dbPokemon?.weight)!
        pokemonDetails!.url = (self.passedUrl)
        
        self.myPokemon = pokemonDetails
        self.myPokemon!.url = self.passedUrl
        
        var types = [TypeElement]()
        let typeElement: TypeElement? = TypeElement()
        let species: Species? = Species()
        species?.name = (dbPokemon?.types)!
        typeElement!.type = species!
        types.append(typeElement!)
        
        pokemonDetails?.types = types
        
        self.output?.updatePokeData(myPokemon: pokemonDetails!)
        
    }
}

