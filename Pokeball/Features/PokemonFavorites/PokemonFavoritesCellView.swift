//
//  PokemonFavoritesCellView.swift
//  Pokeball
//
//  Created by Pavle on 30.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import UIKit

class PokemonFavoritesCellView: UITableViewCell {
    
    var delegateCell:CellDelegate?
    var viewModel: PokemonListViewModel = PokemonListViewModel()
    var url: String = " "
    
    @IBOutlet weak var labelNameForFavPokemon: UILabel?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.delegateCell = nil
    }
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 4
            frame.size.height -= 2 * 5
            super.frame = frame
        }
    }
}

