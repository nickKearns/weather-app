//
//  View+Extensions.swift
//  WeatherApp
//
//  Created by Mohammad Azam on 5/11/21.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
