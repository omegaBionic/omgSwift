//
//  API.swift
//  omgSwift
//
//  Created by Julien BOULLY on 21/01/2021.
//

import Foundation

class Api {
    private func requestFactory(url: String)-> String{
        var retRequest = ""
        
        // If needed, not yet implement
        
        return retRequest
    }
    
    static func getPlayer(searchBar: String) -> Player{
        
        // Create player and others return vars
        let player = Player()
        
        // Concatenate URL
        print("[Api.getPlayer] Concatenate URL")
        let url = URL(string: "https://api.worldoftanks.eu/wot/account/list/?search=\(searchBar)&application_id=f75bff43140282ba22c62f2f3226207d")!
        
        // Declare and lock semaphore for wait request
        let sem = DispatchSemaphore.init(value: 0)
        
        // Get players on wargaming API
        print("[Api.getPlayer] Get players on wargaming API")
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            //print("The response is : ", String(data: data, encoding: .utf8)!)
            //print(NSString(data: data, encoding: String.Encoding.utf8.rawValue) as Any)

            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                if let dictionary = jsonObject as? [String: Any] {
                    if let results = dictionary["data"] as? [[String:Any]] {
                        // Check search contain result(s)
                        if results.indices.contains(0) {
                            // Save player found
                            player.nickname = results[0]["nickname"] as? String
                            player.account_id = results[0]["account_id"] as? Int
                            if player.nickname == searchBar {
                                print("[Api.getPlayer] Player found: '\(searchBar)'")
                                player.isFound = true
                                
                            } else {
                                print("[Api.getPlayer] Player not found: '\(searchBar)'")
                                player.isFound = false
                            }
                        }
                    }
                    
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
                return
            }

            //responce = String(data: data, encoding: .utf8)!

            // Unlock semaphore
            do { sem.signal() }
        }
        task.resume()

        // Wait unlock semaphore
        sem.wait()
        
        return player
    }
    
    static func getPersonalDatas(player: Player) -> String{
        
        // Debug
        print("[Api.getPersonalDatas] player.isFound: '\(player.isFound)'")
        print("[Api.getPersonalDatas] player.nickname: '\(player.nickname!)'")
        print("[Api.getPersonalDatas] player.account_id: '\(player.account_id!)'")

        // Concatenate URL
        print("[Api.getPersonalDatas] Concatenate URL")
        let url = URL(string: "https://api.worldoftanks.eu/wot/account/info/?account_id=\(player.account_id!)&application_id=f75bff43140282ba22c62f2f3226207d")!
        print("[Api.getPersonalDatas] url: '\(url)'")
        
        // Declare and lock semaphore for wait request
        let sem = DispatchSemaphore.init(value: 0)
        
        // Get players on wargaming API
        print("[Api.getPersonalDatas] Get players on wargaming API")
        var ret = ""
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            //print("The response is : ", String(data: data, encoding: .utf8)!)
            //print(NSString(data: data, encoding: String.Encoding.utf8.rawValue) as Any)

            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                //print(jsonObject)
                if let dictionary = jsonObject as? [String: Any] {
                    ret = "\(dictionary)"
                    if let results = dictionary["data"] as? [[String:Any]] {
                        // Check search contain result(s)
                        if results.indices.contains(0) {
                            // if we split, use ret
                            
                        }
                    }
                    
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
                return
            }

            //responce = String(data: data, encoding: .utf8)!

            // Unlock semaphore
            do { sem.signal() }
        }
        task.resume()

        // Wait unlock semaphore
        sem.wait()
        
        return ret
    }
    
    static func getAchievementsDatas(player: Player) -> String{
        
        // Debug
        print("[Api.getPersonalDatas] player.isFound: '\(player.isFound)'")
        print("[Api.getPersonalDatas] player.nickname: '\(player.nickname!)'")
        print("[Api.getPersonalDatas] player.account_id: '\(player.account_id!)'")

        // Concatenate URL
        print("[Api.getPersonalDatas] Concatenate URL")
        let url = URL(string: "https://api.worldoftanks.eu/wot/account/achievements/?application_id=f75bff43140282ba22c62f2f3226207d&account_id=\(player.account_id!)")!
        print("[Api.getPersonalDatas] url: '\(url)'")
        
        // Declare and lock semaphore for wait request
        let sem = DispatchSemaphore.init(value: 0)
        
        // Get players on wargaming API
        print("[Api.getPersonalDatas] Get players on wargaming API")
        var ret = ""
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            //print("The response is : ", String(data: data, encoding: .utf8)!)
            //print(NSString(data: data, encoding: String.Encoding.utf8.rawValue) as Any)

            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                //print(jsonObject)
                if let dictionary = jsonObject as? [String: Any] {
                    ret = "\(dictionary)"
                    if let results = dictionary["data"] as? [[String:Any]] {
                        // Check search contain result(s)
                        if results.indices.contains(0) {
                            // if we split, use ret
                            
                        }
                    }
                    
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
                return
            }

            //responce = String(data: data, encoding: .utf8)!

            // Unlock semaphore
            do { sem.signal() }
        }
        task.resume()

        // Wait unlock semaphore
        sem.wait()
        
        return ret
    }
}
