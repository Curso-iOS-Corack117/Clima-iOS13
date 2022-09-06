//
//  WeatherManager.swift
//  Clima
//
//  Created by Sergio Ordaz Romero on 05/09/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=2fc9cb981a9cf9748d5f57d344825368&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url: URL = URL(string: urlString) {
            let session: URLSession = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = parseJSON(weatherData: safeData) {
                        
                    }
                    
                }
            }
            task.resume()
        }
    }
        
    func parseJSON(weatherData: Data) -> WeatherModel? {
//        let dataString = String(data: weatherData, encoding: .utf8)
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let weather = decodedData.weather[0].main
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weatherModel = WeatherModel(weather: weather, cityName: name, temperature: temp)
            return weatherModel
        } catch {
            print(error)
            return nil
        }
    }
}
