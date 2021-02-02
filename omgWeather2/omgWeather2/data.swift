//
//  data.swift
//  omgWeather2
//
//  Created by Julien BOULLY on 02/02/2021.
//

import Foundation

class Weather {
    let city: String
    let country: String
    var temperature: Double
    init(city: String, country: String, temperature: Double) {
        self.city = city
        self.country = country
        self.temperature = temperature
    }
    func updateTemperature () {
        temperature += Double.random(in: -1.0 ... 1.0)
    }
}
