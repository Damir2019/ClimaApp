//
//  WeatherData.swift
//  Clima
//
//  Created by damir hodez on 06/02/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let weather: [Weather]
    let main: Main
    let name: String
}

struct Weather: Decodable {
    let id: Int
}

struct Main: Decodable {
    let temp: Double
}
