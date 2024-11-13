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
            }
        }
}

#Preview {
    ContentView()
}
