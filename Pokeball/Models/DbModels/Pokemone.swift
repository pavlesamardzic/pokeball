//
//  Pokemone.swift
//  Pokeball
//
//  Created by Pavle on 30.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class Pokemone: Object {
    
    @objc dynamic var url: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var imageUrl: String = ""
    @objc dynamic var experience: Int = 0
    @objc dynamic var weight: Int = 0
    @objc dynamic var types: String = ""
    
    override class func primaryKey() -> String? {
        return "url"
    }
    
    required init() {
        super.init()
    }
    
    init(url: String, name: String, imageUrl: String, experience: Int, weight: Int, types: String) {
        super.init()
        self.url = url
        self.name = name
        self.imageUrl = imageUrl
        self.experience = experience
        self.weight = weight
        self.types = types
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
}

