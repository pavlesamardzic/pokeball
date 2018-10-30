//
//  VersionGroupDetail.swift
//  Pokeball
//
//  Created by Pavle on 30.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import ObjectMapper

class VersionGroupDetail: Mappable {
    
    var levelLearnedAt: String
    var moveLearnMethod, versionGroup : Species
    
    required init?(map: Map) {
        self.levelLearnedAt = ""
        self.moveLearnMethod = Species(map: map)!
        self.versionGroup = Species(map: map)!
    }
    
    func mapping(map: Map) {
        levelLearnedAt <- map["levelLearnedAt"]
        moveLearnMethod <- map["moveLearnMethod"]
        versionGroup <- map["versionGroup"]
    }
}
