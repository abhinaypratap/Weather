//
//  WeatherManager.swift
//  Weather
//
//  Created by Abhinay Pratap on 06/07/22.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=fa44332bc0091327c228ecd613384cf3&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
}
