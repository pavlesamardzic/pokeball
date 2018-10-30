//
//  Pokemon.swift
//  Pokeball
//
//  Created by Pavle on 25.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class User: Object {
    
    @objc dynamic
    var username: String = ""
    
    override class func primaryKey() -> String? {
        return "username"
    }
    
    required init() {
        super.init()
    }
    
    init(username: String) {
        super.init()
        self.username = username
        
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
}
