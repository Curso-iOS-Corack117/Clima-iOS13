//
//  WeatherData.swift
//  Clima
//
//  Created by Sergio Ordaz Romero on 05/09/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Weather: Decodable {
    let main: String
}

struct Main: Decodable {
    let temp: Float
}
