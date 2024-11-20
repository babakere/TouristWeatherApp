//
//  NavBar.swift
//  CWK2Template
//
//  Created by girish lukka on 29/10/2023.
//

import SwiftUI

// structure represents the navigation bar of the application using a tabview.
struct NavBar: View {
    @State private var selectedCity = ""  // Add this line to declare selectedCity
       @StateObject private var weatherMapViewModel = WeatherMapViewModel()  // Add this line to declare weatherMapViewModel
    var body: some View {
        
     
            
            TabView {
                WeatherNowView()
                    .tabItem {
                        Label("City", systemImage: "magnifyingglass")
                    }
                WeatherForecastView()
                    .tabItem {
                        Label("Forecast", systemImage: "calendar")
                    }
                TouristPlacesMapView()
                // Pass the instance to TouristPlacesMapView
                
                
                    .tabItem {
                        Label("Place Map", systemImage: "map")
                    }
            }
        
            
        }
    
}
