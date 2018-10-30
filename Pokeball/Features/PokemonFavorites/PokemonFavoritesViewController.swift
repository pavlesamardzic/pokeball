//
//  PokemonFavorites.swift
//  Pokeball
//
//  Created by Pavle on 24.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import UIKit
class PokemonFavorites: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    let dbHelper: DBHellper? = DBHellper()
    var pokemonFavoritesViewModel: PokemonFavoritesViewModel? = PokemonFavoritesViewModel()
    
    
    override func viewWillAppear(_ animated: Bool) {
        readAllFromDb()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    func readAllFromDb(){
        let pokemons = dbHelper?.getAllSavedPokemons()
        
        var savedPokemonList: Array<ApiPokemonList> = Array<ApiPokemonList>()
        for p in pokemons! {
            let apiPokemon: ApiPokemonList = ApiPokemonList()!
            apiPokemon.name = p.name
            apiPokemon.url = p.url
            savedPokemonList.append(apiPokemon)
        }
        
        pokemonFavoritesViewModel?.numberOfSaved = (savedPokemonList.count)
        pokemonFavoritesViewModel?.savedPokemonList = savedPokemonList
    }
    
    @IBAction func BackButton(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PokemonFavoritesCellView
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cell") as! PokemonFavoritesCellView
        }
        
        cell.layer.cornerRadius = 15
        if let pokeFavModel = pokemonFavoritesViewModel {
            let title = String(pokeFavModel.savedPokemonList[indexPath.row].name)
            cell.labelNameForFavPokemon?.text = title
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "PokemonDetails", bundle:nil)
        let userDefaultStore = UserDefaults.standard
        userDefaultStore.set(pokemonFavoritesViewModel!.savedPokemonList[indexPath.row].url, forKey: "key_url")
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PokemonDetails")
        self.present(nextViewController, animated:true, completion:nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (pokemonFavoritesViewModel?.savedPokemonList.count)!
    }
}
