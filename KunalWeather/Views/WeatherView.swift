//
//  WeatherView.swift
//  KunalWeather
//
//  Created by Kunal Bajaj on 2024-11-10.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            if let weather = viewModel.weather {
                Text("Location: \(weather.location.name), \(weather.location.region), \(weather.location.country)")
                    .font(.headline)
                
                Text("Temperature: \(weather.current.temp_c)°C (\(weather.current.temp_f)°F)")
                Text("Condition: \(weather.current.condition.text)")
                Text("Humidity: \(weather.current.humidity)%")
                Text("Feels Like: \(weather.current.feelslike_c)°C (\(weather.current.feelslike_f)°F)")
                if(weather.current.air_quality != nil){
                    Text("Air quality(co): \(weather.current.air_quality?.co ?? 0)")
                    Text("Air quality(no2): \(weather.current.air_quality?.no2 ?? 0)")
                }
            } else {
                Text("Fetching weather data...")
            }
        }
        .padding()
        .onAppear {
            viewModel.getWeather(for: "Mississauga", aqi: "yes"){ result in
                switch result {
                case .success:
                    print("Weather data fetched successfully")
                case .failure(let error):
                    print("Error fetching weather data: \(error)")
                }
            }
        }
    }
}

#Preview {
    WeatherView()
}
