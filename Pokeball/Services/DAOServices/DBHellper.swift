//
//  UserDAO.swift
//  Pokeball
//
//  Created by Pavle on 30.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import RealmSwift

class DBHellper {
    
    func saveUser(_ user: User?) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(user!)
        }
        
    }
    
    func getUser() -> Results<User>{
        let realm = try! Realm()
        
        let user = realm.objects(User.self)
        return user
    }
    
    func deleteAllOldUserPreferences() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func addPokemonToFav(pokemon: Pokemone?){
        let realm = try! Realm()
        try! realm.write {
            realm.add(pokemon!)
        }
    }
    
    func getAllSavedPokemons() -> Results<Pokemone>{
        let realm = try! Realm()
        let pokemon = realm.objects(Pokemone.self)
        
        return pokemon
    }
    
    func isFavPokemon(url: String) -> Pokemone?{
        let realm = try! Realm()
        let predicate = NSPredicate(format: "url == %@", url)
        let pokemon = realm.objects(Pokemone.self).filter(predicate).first
        
        if let poke = pokemon{
            return poke
        }
        
        return nil
    }
    
    func removePokemonFromDb(pokemone: Pokemone){
        let realm = try! Realm()
        try! realm.write {
            realm.delete(pokemone)
        }
    }
    
}

