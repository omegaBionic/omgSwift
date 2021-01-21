//
//  API.swift
//  omgSwift
//
//  Created by Julien BOULLY on 21/01/2021.
//

import Foundation

/** Take request
    Return json with request
 */
class Api {
    static func getPlayer(searchBar: String) -> Player{
        
        // Create player and others return vars
        let player = Player()
        
        // Concatenate URL
        print("[searchButton] Concatenate URL")
        let url = URL(string: "https://api.worldoftanks.eu/wot/account/list/?search=\(searchBar)&application_id=:)")!
        
        // Declare and lock semaphore for wait request
        let sem = DispatchSemaphore.init(value: 0)
        
        // Get players on wargaming API
        print("[searchButton] Get players on wargaming API")
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
                                print("[searchButton] Player found: '\(searchBar)'")
                                player.isFound = true
                                
                            } else {
                                print("[searchButton] Player not found: '\(searchBar)'")
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
}
