//
//  WeatherModel.swift
//  Clima
//
//  Created by Sergio Ordaz Romero on 05/09/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let weather: String
    let cityName: String
    let temperature: Float
    
    var temperatureString: String {
        String(format: "%.1f", temperature )
    }
    
    var conditionName: String{
        switch weather {
        case "Thunderstorm":
            return "cloud.bolt"
        case "Drizzle":
            return "cloud.drizzle"
        case "Rain":
            return "cloud.rain"
        case "Snow":
            return "cloud.snow"
        case "Clear":
            return "sun.max"
        case "Clouds":
            return "cloud.bolt"
        default:
            return "cloud.fog"
        }
    }
}
