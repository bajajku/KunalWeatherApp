//
//  WeatherView.swift
//  KunalWeather
//
//  Created by Kunal Bajaj on 2024-11-10.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @StateObject private var locationManager = MyLocationManager()

    var body: some View {
        VStack(spacing: 16) {
            if let weather = viewModel.weather {
                Text("\(weather.location.name), \(weather.location.country)")
                    .font(.title)
                    .bold()
                
                Text("Temperature: \(String(format: "%.1f", weather.current.temp_c))°C")
                Text("Feels Like: \(String(format: "%.1f", weather.current.feelslike_c))°C")
                Text("Condition: \(weather.current.condition.text)")
                Text("Wind: \(String(format: "%.1f", weather.current.wind_kph)) km/h \(weather.current.wind_dir)")
                Text("Humidity: \(weather.current.humidity)%")
                Text("UV Index: \(String(format: "%.1f", weather.current.uv))")
                Text("Visibility: \(String(format: "%.1f", weather.current.vis_km)) km")
            } else {
                ProgressView()
                Text("Fetching weather data...")
            }
        }
        .padding()
        .onChange(of: locationManager.myCoordinate) { coordinate in
            if let coord = coordinate {
                viewModel.getWeather(for: (coord.latitude, coord.longitude), aqi: "no") { _ in }
            }
        }
    }
}

#Preview {
    WeatherView()
}
