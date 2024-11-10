import Foundation

class WeatherViewModel: ObservableObject, Identifiable {
    
    @Published var weather: Weather?
    
    let baseURL: String = "https://api.weatherapi.com/v1/current.json?"
    let key: String = "0f9872779b184f46b1c185742241011"
    
    func getWeather(for city: String, aqi: String, completion: @escaping (Result<Data, Error>) -> Void) {
        
        let urlString = baseURL + "key=\(key)&q=\(city)&aqi=\(aqi)"
        print("URL: \(urlString)")
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(.failure(error))
                return
            }
            
            if let data = data {
                print("Data received: \(String(data: data, encoding: .utf8) ?? "Unable to convert data to string")")
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            } else {
                print("No data received.")
            }
        }
        
        task.resume()
    }
}
