//
//  PokemonDetailsService.swift
//  Pokeball
//
//  Created by Pavle on 30.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class PokemonDetailsService: BaseNetworkService {
    
    func getPokemonDetails(url: String, succeededRequest: @escaping (PokemonDetails)->(), failedRequest: @escaping (Error) -> ()){
        let request: URLRequest = buildRequest(path: url, method: .get, encoding: JSONEncoding())
        execute(request: request).responseObject {(response: DataResponse<PokemonDetails>) in
            if let _error = response.error{
                failedRequest(_error)
            }
            //these two are exclusively
            if let _error = response.result.error{
                failedRequest(_error)
            }
            if let _value = response.value{
                succeededRequest(_value)
            }
        }
    }
}
