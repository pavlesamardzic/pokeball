//
//  JSONCodingKey.swift
//  Pokeball
//
//  Created by Pavle on 30.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation

class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
    }
    
    required init?(stringValue: String) {
        key = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    var stringValue: String {
        return key
    }
}
