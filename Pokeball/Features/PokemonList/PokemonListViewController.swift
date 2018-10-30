//
//  PokemonList.swift
//  Pokeball
//
//  Created by Pavle on 24.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import UIKit

class PokemonListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PokemonListViewProtocol, CellDelegate {
    
    @IBOutlet weak var labelWelcome: UILabel?
    @IBOutlet weak var tableView: UITableView!
    var viewModel: PokemonListViewModel = PokemonListViewModel()
    
    var viewCellView: PokemonCellView = PokemonCellView()
    var url : String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefault = UserDefaults.standard
        labelWelcome?.text = "Welcome " + userDefault.string(forKey: "key_Value")!
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.output = self as PokemonListViewProtocol
        viewModel.getData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PokemonCellView
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cell") as! PokemonCellView
        }
        
        
        cell.layer.cornerRadius = 15
        cell.labelName?.text = viewModel.pokemonList[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemonList.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "PokemonDetails", bundle:nil)
        let userDefaultStore = UserDefaults.standard
        userDefaultStore.set(viewModel.pokemonList[indexPath.row].url, forKey: "key_url")
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PokemonDetails")
        self.present(nextViewController, animated:true, completion:nil)
        
    }
    
    func didTapCell(url: String) {
        transitionToDetails()
    }
    
    @IBAction func buttonOpenFavorites (){
        let storyBoard : UIStoryboard = UIStoryboard(name: "PokemonFavorites", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PokemonFavorites")
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    func refreshTableView() {
        self.tableView.reloadData()
    }
    
    func showPopup(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func transitionToDetails()
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let resultViewController = storyBoard.instantiateViewController(withIdentifier: "PokemonDetails") as! PokemonDetailsViewController
        resultViewController.labelDetails.text = url
        self.present(resultViewController, animated:true, completion:nil)
    }
}
