//
//  Double+Extensions.swift
//  WeatherApp
//
//  Created by Mohammad Azam on 5/11/21.
//

import Foundation

enum TemperatureUnit {
    case fahrenheit
    case celsius
}

extension Double {
    func formatAsTemperature(unit: TemperatureUnit = .fahrenheit) -> String {
        
        switch unit {
            case .fahrenheit:
                return String(format: "%.0f F", self)
            case .celsius:
                return String(format: "%.0f C", self)
        }
       
    }
}
