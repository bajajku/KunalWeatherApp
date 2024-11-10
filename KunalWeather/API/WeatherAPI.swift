//
//  WeatherAPI.swift
//  KunalWeather
//
//  Created by Kunal Bajaj on 2024-11-10.
//

import Foundation

class Weather: Codable{
    let temp_c: String
    let feelslike_c: String
    let wind_kph: String
    let wind_dir: String
    let humidity: String
    let uv: String
    let vis_km: String
    let condition: String
}

class WeatherAPI{
    
    let baseURL: String = "https://api.weatherapi.com/v1/current.json?"
    let key: String = "666666666666666666666666666666"
    
    
    
    func getWeather(for city: String, completion: @escaping (Result<Weather, Error>) -> Void){
        let urlString = baseURL + "key=\(key)&q=\(city)"
        
    }
}
