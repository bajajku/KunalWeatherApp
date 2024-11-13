import SwiftUI

struct MapView: View {
    @StateObject private var locationManager = MyLocationManager()
    
    var body: some View {
        VStack {
            if let coordinate = locationManager.myCoordinate {
                Text("Latitude: \(coordinate.latitude)")
                Text("Longitude: \(coordinate.longitude)")
            } else {
                Text("Fetching location...")
            }
        }
        .padding()
        .onAppear {
            // Start updating location when the view appears
            locationManager.manager?.startUpdatingLocation()
        }
    }
}
