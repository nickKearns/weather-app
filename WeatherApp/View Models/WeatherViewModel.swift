//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mohammad Azam on 5/11/21.
//

import Foundation
import Apollo

enum LoadingStatus {
    case none
    case success
    case failure
    case notFound
}

class WeatherViewModel: ObservableObject {
    
    var city: String = ""
    var weatherInfo: WeatherInfoViewModel?
    let weatherIcons = ["03d": "cloud", "04d": "Smoke"]
    @Published var loadingStatus = LoadingStatus.none
    
    private func getSystemIcon(icon: String?) -> String? {
        if let icon = icon {
            return weatherIcons[icon] ?? weatherIcons["03d"]
        }
        
        return "exclamationmark"
    }
    
    func fetchWeatherByCityName(city: String) {
        Network.shared.apollo.fetch(query: GetWeatherByCityNameQuery(city: city)) { result in
            switch result {
            case .success(let graphQLResult):
                print(graphQLResult)
                guard let data = graphQLResult.data,
                      let getCityName = data.getCityByName,
                      let weather = getCityName.weather,
                      let summary = weather.summary,
                      let title = summary.title,
                      let description = summary.description,
                      let clouds = weather.clouds,
                      let humidity = clouds.humidity,
                      let temperature = weather.temperature,
                      let actual = temperature.actual,
                      let feelsLike = temperature.feelsLike,
                      let icon = self.getSystemIcon(icon: summary.icon) else {
                    DispatchQueue.main.async {
                        self.loadingStatus = .notFound
                    }
                    return
                }
                
                self.weatherInfo = WeatherInfoViewModel(temperature: actual, humidity: humidity, summaryTitle: title, summaryDescription: description, feelsLike: feelsLike, icon: icon)
                DispatchQueue.main.async {
                    self.loadingStatus = .success
                }
                    
                
            case .failure(_):
                DispatchQueue.main.async {
                    self.loadingStatus = .failure
                }
            
            }
        }
    }
    
}


struct WeatherInfoViewModel {
    let temperature: Double
    let humidity: Int
    let summaryTitle: String
    let summaryDescription: String
    let feelsLike: Double
    let icon: String
}
