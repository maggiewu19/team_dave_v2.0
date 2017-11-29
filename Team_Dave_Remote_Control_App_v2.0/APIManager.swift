//
//  APIManager.swift
//  Team_Dave_Remote_Control_App_v2.0
//
//  Created by Team Dave on 11/15/17.
//  Copyright © 2017 Shang-Yun Wu. All rights reserved.
//

import Foundation

class APIManager {
    
    public static let shared = APIManager()
    // must set the ip and email when using app for the first time
    public var ip : String? = UserDefaults.standard.string(forKey: "ip")
    public var email : String? = UserDefaults.standard.string(forKey: "email")
    
    func power(volume: String) {
        // setup the session to make POST call
        let param = "?params=" + volume
        let postEndpoint: String = "http://" + ip! + "/" + "power" + param
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
    }
    
    func channel(channel: String) {
        // setup the session to make POST call
        let param = "?params=" + channel
        let postEndpoint: String = "http://" + ip! + "/" + "channel" + param
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
                print ("Error calling POST on channel")
                print (error as Any)
                return
            }
            return
        }
        task.resume()
    }

    
    func volume(currentVol: String, newVol: String) {
        // setup the session to make POST call
        let param = "?params=" + "[" + currentVol + "," + newVol + "]";
        let postEndpoint: String = "http://" + ip! + "/" + "volume" + param
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
                print ("Error calling POST on volume")
                print (error as Any)
                return
            }
            return
        }
        task.resume()
    }

    func volumeUp() {
        // setup the session to make POST call
        let postEndpoint: String = "http://" + ip! + "/" + "volumeup"
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
                print ("Error calling POST on volumeUp")
                print (error as Any)
                return
            }
            return
        }
        task.resume()
    }

    func volumeDown() {
        // setup the session to make POST call
        let postEndpoint: String = "http://" + ip! + "/" + "volumedown"
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
                print ("Error calling POST on volumedown")
                print (error as Any)
                return
            }
            return
        }
        task.resume()
    }
    
    func email(email: String) {
        // setup the session to make POST call
        let param = "?params=" + email
        let postEndpoint: String = "http://" + ip! + "/" + "email" + param
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
                print ("Error calling POST on email")
                print (error as Any)
                return
            }
            return
        }
        task.resume()
    }

}
