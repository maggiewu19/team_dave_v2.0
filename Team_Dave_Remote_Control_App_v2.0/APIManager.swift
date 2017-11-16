//
//  APIManager.swift
//  Team_Dave_Remote_Control_App_v2.0
//
//  Created by Team Dave on 11/15/17.
//  Copyright © 2017 Shang-Yun Wu. All rights reserved.
//

import Foundation

class APIManager {
    
    var ip = "http://18.24.1.249/"
    
    func power() {
        // setup the session to make POST call
        let postEndpoint: String = ip + "power"
        let url = URL(string: postEndpoint)!
        let session = URLSession.shared
        let postParams : [String: Any] = ["return_value": 1,
                                          "id": "",
                                          "name": "",
                                          "hardware": "esp8266",
                                          "connected": true]
        
        // create the request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: postParams, options: [])
        } catch {
            print("Error: cannot create JSON from postParams")
        }
        
        // make the POST call
        let task = session.dataTask(with: request) {
            (data, response, error) in
            guard error == nil else {
                print ("Error calling POST on power")
                print (error as Any)
                return
            }
            return
        }
        task.resume()
//        session.dat
    }
    
//    func channel {
//
//    }
//
//    func channelUp {
//
//    }
//
//    func channelDown {
//
//    }
//
//    func volumeUp {
//
//    }
//
//    func volumeDown {
//
//    }
    
    
}
