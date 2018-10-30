//
//  StringValueDb.swift
//  Pokeball
//
//  Created by Pavle on 29.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class StringValueDb: Object {
    
    @objc dynamic
    var value: String = ""
}
