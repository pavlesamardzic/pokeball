//
//  NetworkManager.swift
//  Pokeball
//
//  Created by Pavle on 25.10.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Alamofire

class NetworkManager: SessionManager{
    
    // MARK: - Singleton instance
    static let shared: Alamofire.SessionManager = {
        
        var defaultHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        defaultHeaders["Content-Type"] = "application/json"
        defaultHeaders["Accept"] = "application/json"
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = defaultHeaders
        configuration.timeoutIntervalForRequest = 10
        
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        
        return sessionManager
    }()
}
