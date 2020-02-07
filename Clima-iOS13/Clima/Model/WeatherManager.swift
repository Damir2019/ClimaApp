//
//  WeatherManager.swift
//  Clima
//
//  Created by damir hodez on 06/02/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=d833345c2c89c895c7c2d4334195be79&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(from: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(from: urlString)
    }
    
    func performRequest(from urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailedWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weatherModel = self.parseJSON(weatherData: safeData) {
                        DispatchQueue.main.async {
                            self.delegate?.didUpdateWeather(self, weather: weatherModel)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let cityName = decodedData.name
            let temperature = decodedData.main.temp
            
            let weatherModel = WeatherModel(conditionID: id, cityName: cityName, temperature: temperature)
            return weatherModel
        } catch {
            delegate?.didFailedWithError(error: error)
            return nil
        }
    }
}

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ : WeatherManager, weather: WeatherModel)
    
    func didFailedWithError(error: Error)
}
