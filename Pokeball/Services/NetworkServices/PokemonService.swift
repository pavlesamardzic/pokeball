//
//  PokemonService.swift
//  Pokeball
//
//  Created by Pavle on 24.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//


import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class PokemonService: BaseNetworkService {
    
    func getPokemons(completion: @escaping(_ transactions: ApiPokemon, _ error: Error?) -> ()){
        let request: URLRequest = buildRequest(path: "/pokemon", method: .get, encoding: URLEncoding())
        execute(request: request).responseObject {(response: DataResponse<ApiPokemon>) in
            completion(response.result.value!, response.result.error)
        }
    }
}
