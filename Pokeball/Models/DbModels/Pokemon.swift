//
//  Pokemon.swift
//  Pokeball
//
//  Created by Pavle on 29.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

enum TransactionType: Int {
    case SentTransaction = 0
    case ReceivedTransaction = 1
    case None = 2
}


class Pokemon: Object {
    
    @objc dynamic
    var name: String = ""
    
    @objc dynamic
    var url: String = ""
    
    let pokemons = List<StringValueDb>()
    let favorites = List<StringValueDb>()
    
    
    override class func primaryKey() -> String? {
        return "url"
    }
    
    required init() {
        super.init()
    }
    
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
}
