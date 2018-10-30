//
//  ApiConfiguration.swift
//  Pokeball
//
//  Created by Pavle on 25.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation

protocol ApiConfiguration: class {
    var url: String{ get set }
}

class BaseConfiguration: ApiConfiguration {
    var url: String
    static let shared: BaseConfiguration = BaseConfiguration()
    
    init() {
        self.url = Bundle.main.object(forInfoDictionaryKey: "productionApiUrl") as? String ?? ""
    }
}
