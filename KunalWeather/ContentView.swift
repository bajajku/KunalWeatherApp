//
//  ContentView.swift
//  KunalWeather
//
//  Created by Kunal Bajaj on 2024-11-10.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
        
        var body: some View {
            VStack {
                Text("Weather Data Fetching...")
                Button("Get"){
                    viewModel.getWeather(for : "Toronto", aqi: "yes") { result in
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
}

#Preview {
    ContentView()
}
