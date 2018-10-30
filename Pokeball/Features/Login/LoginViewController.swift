//
//  Login.swift
//  Pokeball
//
//  Created by Pavle on 24.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import UIKit
import Realm

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    var userDao: DBHellper? = nil
    
    override func viewDidLoad() {
        self.hideKeyboardWhenTappedAround()
        userDao = DBHellper()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if ((userDao?.getUser().count)! > 0) {
            let username = userDao?.getUser()[0].username
            openMain(username: username!)
        }
    }
    
    @IBAction func buttonContinue(_ sender: Any)
    {
        let username = usernameTextField.text
        if(username == "")
        {
            let alert = UIAlertController(title: "Error", message: "Please enter your username.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        else {
            openMain(username: username!)
            saveToDb(username: username!)
        }
    }
    
    func openMain(username: String) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "PokemonList", bundle:nil)
        let userDefaultStore = UserDefaults.standard
        userDefaultStore.set(username, forKey: "key_Value")
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PokemonList")
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    func saveToDb(username: String){
        userDao?.deleteAllOldUserPreferences()
        let user = User()
        user.username = usernameTextField.text!
        userDao?.saveUser(user)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? PokemonListViewController
        vc?.labelWelcome?.text = self.usernameTextField.text
    }
}
