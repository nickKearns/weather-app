//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mohammad Azam on 5/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var weatherVM = WeatherViewModel()
    
    var body: some View {
        
        VStack {
            
            TextField("City", text: $weatherVM.city) { (_) in
                
            } onCommit: {
                weatherVM.fetchWeatherByCityName(city: weatherVM.city)
            }.textFieldStyle(RoundedBorderTextFieldStyle())
            
            Spacer()
            
            switch weatherVM.loadingStatus {
            case .success:
                weatherVM.weatherInfo.map {
                    WeatherView(vm: $0)
                }
            case .notFound:
                InvalidCityView(city: weatherVM.city)
            case .none, .failure:
                EmptyView()
                
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Weather")
        .embedInNavigationView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


