//
//  WeatherForcastView.swift
//  CWK2Template
//
//  Created by girish lukka on 29/10/2023.
//

import SwiftUI

struct WeatherForecastView: View {
    @EnvironmentObject var weatherMapViewModel: WeatherMapViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                // Hourly forecast section
                if let hourlyData = weatherMapViewModel.weatherDataModel?.hourly {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(hourlyData) { hour in
                                HourWeatherView(current: hour)
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .frame(width: 350, height: 180)
                    .background(
                        Image("background2")
                            .resizable()
                            .scaledToFill()
                            .offset(y: -20)
                            .opacity(0.7)
                    )
                }
                
                Divider()
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                
                // Daily forecast section
                ScrollView() {
                    ZStack {
                        Color.white
                        List {
                            ForEach(weatherMapViewModel.weatherDataModel?.daily ?? []) { day in
                                DailyWeatherView(day: day)
                                    .frame(width: 350, height: 50)
                            }
                        }
                        .listStyle(GroupedListStyle())
                        .frame( height: 700)
                        
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(systemName: "sun.min.fill")
                        VStack {
                            Text("Weather Forecast for \(weatherMapViewModel.city)")
                                .font(.title3)
                                .fontWeight(.bold)
                        }
                    }
                }
            }
        }
    }
}


