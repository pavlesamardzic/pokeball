//
//  PokemonDetails.swift
//  Pokeball
//
//  Created by Pavle on 24.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import UIKit
class PokemonDetailsViewController: UIViewController, PokemonDetailsProtocol {
    
    @IBOutlet weak var labelDetails: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelExperience: UILabel!
    @IBOutlet weak var labelWeight: UILabel!
    @IBOutlet weak var labelTypes: UILabel!
    
    var dbHelper: DBHellper = DBHellper()
    var viewModel: PokemonDetailsViewModel = PokemonDetailsViewModel()
    
    
    @IBAction func onFavPressed(_ sender: Any) {
        
        if (viewModel.isFav == false){
            var defultImage = ""
            if (viewModel.myPokemon?.sprites.frontDefault.isEmpty == false){
                defultImage = (viewModel.myPokemon?.sprites.frontDefault)!
            }
            
            let types = labelTypes.text
            let pokemone: Pokemone = Pokemone(
                url: (viewModel.myPokemon?.url)!,
                name: (viewModel.myPokemon?.name)!,
                imageUrl: defultImage,
                experience: (viewModel.myPokemon?.baseExperience)!,
                weight: (viewModel.myPokemon?.weight)!,
                types: types!
            )
            dbHelper.addPokemonToFav(pokemon: pokemone)
            setRemoveUi(dbPokemon: pokemone)
            
        } else if (viewModel.isFav == true){
            dbHelper.removePokemonFromDb(pokemone: viewModel.dbPokemon!)
            setAddToFavUi()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.output = self as PokemonDetailsProtocol
        
        let userDefault = UserDefaults.standard
        let passedUrl = userDefault.string(forKey: "key_url")
        labelDetails.text = passedUrl
        viewModel.passedUrl = passedUrl!
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let dbPokemon = dbHelper.isFavPokemon(url: viewModel.passedUrl)
        if (dbPokemon == nil){
            setAddToFavUi()
            viewModel.getData(url: labelDetails.text ?? "test")
        } else {
            setRemoveUi(dbPokemon: dbPokemon!)
            viewModel.remapDbModelToApiModel()
        }
    }
    
    func setAddToFavUi(){
        favButton.setTitle("Add to favorites", for: .normal)
        favButton.backgroundColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 0.5)
        favButton.setTitleColor(.gray , for: .normal)
        favButton.layer.cornerRadius = 15
        viewModel.isFav = false
    }
    
    func setRemoveUi(dbPokemon: Pokemone){
        favButton.setTitle("Remove from favorites", for: .normal)
        favButton.backgroundColor = UIColor.red
        favButton.setTitleColor(.white, for: .normal)
        favButton.layer.cornerRadius = 15
        viewModel.isFav = true
        viewModel.dbPokemon = dbPokemon
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func updatePokeData(myPokemon: PokemonDetails) {
        labelName.text = myPokemon.name
        labelExperience.text = String(myPokemon.baseExperience)
        labelWeight.text = String(myPokemon.weight)
        
        // image
        if (myPokemon.sprites.frontDefault.isEmpty == false){
            let defultImage = myPokemon.sprites.frontDefault
            let url = URL(string: defultImage)
            let data = try? Data(contentsOf: url!)
            imageView.image = UIImage(data: data!)
        }
        
        
        var types = ""
        for i in myPokemon.types {
            let typeName = i.type.name
            if (types.isEmpty){
                types.append(typeName)
            } else {
                types.append(" \\ " + typeName)
            }
            
        }
        
        print(types)
        labelTypes.text = types
        
    }
    
}

