//
//  Utils.swift
//  omgSwift
//
//  Created by Julien BOULLY on 20/01/2021.
//

import Foundation

extension String {
    func matches(_ regex: String) -> Bool {
        //return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
        
        //let range = NSRange(location: 0, length: self.utf16.count)
        //let regex = try! NSRegularExpression(pattern: regex)
        //return regex.firstMatch(in: self, options: [], range: range) != nil
        
        
        var regexIsMatched = false
        do {
            let regex = try NSRegularExpression(pattern: regex, options: NSRegularExpression.Options.caseInsensitive)
            print("[String/matches] regex: '\(regex)'")
            
            let matches = regex.matches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count))
            print("[String/matches] matches: '\(matches)'")
            
            if matches != [] {
                print("[String/matches] regex is matching.")
                regexIsMatched = true
            } else {
                print("[String/matches] regex is NOT matching.")
                regexIsMatched = false
            }
        } catch {
            print("[String/matches] catch bad regex.")
            regexIsMatched = false
        }
        return regexIsMatched
    }
}

class Utils {
    static func playerIsSearchable(player: String) -> Bool{
        // if player empty
        if (player == ""){
            return false
        }
        
        //let isMatched = player.matches("[a-zA-Z0-9_-]*")
        let isMatched = player.matches("^[a-zA-Z0-9_-]*$")
        print("[Utils/isMatched] isMatched: '\(isMatched)'")

        return isMatched
    }
}
