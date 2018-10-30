//
//  PokemonCellView.swift
//  Pokeball
//
//  Created by Pavle on 26.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import UIKit



//protocol TansitionProtocol: class {
//
//    func transitionToDetails()
//}


class PokemonCellView: UITableViewCell {
    
    var delegateCell:CellDelegate?
    var viewModel: PokemonListViewModel = PokemonListViewModel()
    var url: String = " "
    
    @IBOutlet weak var labelName: UILabel?
    
    func viewDidLoad() {
        viewModel.output = self as? PokemonListViewProtocol
    }
    
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

protocol CellDelegate: class {
    func didTapCell(url: String)
}

