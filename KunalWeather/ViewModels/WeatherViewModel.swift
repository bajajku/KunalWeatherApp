//
//  WeatherViewModel.swift
//  KunalWeather
//
//  Created by Kunal Bajaj on 2024-11-10.
//

import Foundation

class WeatherViewModel: ObservableObject, Identifiable{
    
    @Published var weather: Weather?
    
    let baseURL: String = "https://api.weatherapi.com/v1/current.json?"
    let key: String = "0f9872779b184f46b1c185742241011"
    
    
    
    func getWeather(for city: (String, String), completion: @escaping (Result<Weather, Error>) -> Void){
        var lat: String
        var lon: String
        
        lat = city.0; lon = city.1
        
        let urlString = baseURL + "key=\(key)&q=\(lat),\(lon)"
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let data {
                do{
                    self.weather = try JSONDecoder().decode(Weather.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(self.weather!))
                    }
                }
                catch{
                    print(error)
                }
                
            }
        }
        task.resume()
        
    }
}
