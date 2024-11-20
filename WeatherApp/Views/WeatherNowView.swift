//
//  WeatherNowView.swift
//  CWK2Template
//
//  Created by girish lukka on 29/10/2023.
//

import SwiftUI
// displays current weather information
struct WeatherNowView: View {
    @EnvironmentObject var weatherMapViewModel: WeatherMapViewModel
    @State private var isLoading = false
    @State private var temporaryCity = ""
    
    var body: some View {
        
        
        ZStack {
            Image(.sky)
                .opacity(0.3)
                .offset(y: -840)
            VStack{
                // change location section
                HStack{
                    Text("Change Location")
                    
                    TextField("Enter New Location", text: $temporaryCity)
                        .onSubmit {weatherMapViewModel.city = temporaryCity.replacingOccurrences(of: "  ", with: " ")
                           loadWeatherData()
                            
                        }
                    
                    
                }
             
                .bold()
                .font(.system(size: 20))
                .padding(30)
                .shadow(color: .blue, radius: 10)
                .cornerRadius(10)
                .fixedSize()
                .font(.custom("Arial", size: 26))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(15)
                
                VStack(){
                    HStack{
                        Text("Current Location: \(weatherMapViewModel.city)")
                    }
                    .bold()
                    .font(.system(size: 20))
                    .padding(10)
                    .shadow(color: .blue, radius: 10)
                    .cornerRadius(10)
                    .fixedSize()
                    .font(.custom("Arial", size: 26))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(15)
                    
                    // current date and time
                    
                    let timestamp = TimeInterval(weatherMapViewModel.weatherDataModel?.current.dt ?? 0)
                    let formattedDate = DateFormatterUtils.formattedDateTime(from: timestamp)
                    Text(formattedDate)
                        .padding()
                        .font(.title)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 1)
                } // vstack holding the location and date
                .padding(.bottom, 20)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
                
                
                
                HStack(alignment: .center) {
                    if let forecast = weatherMapViewModel.weatherDataModel?.current {
                        // Display weather data if it's available
                        Spacer()
                        VStack(alignment: .leading){
                            // images in here
                            AsyncImage(url: URL(string:"https://openweathermap.org/img/wn/\(forecast.weather[0].icon)@2x.png")){ image in
                                image
                                    .resizable()
                                    .frame(width: 60, height: 60)
                            }placeholder: {
                                Color.gray
                            }
                            
                            
                            Image("temperature")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Image("humidity").resizable().frame(width: 50, height: 50)
                            Image("pressure")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .leading)
                            
                            Image("windSpeed").resizable().frame(width: 50, height: 50)
                            
                        }
                        
                        VStack(alignment: .center, spacing: 30){
                            // texts
                            Text(forecast.weather[0].main.rawValue)
                                .font(.system(size: 25, weight: .medium))
                                
                                .multilineTextAlignment(.center)
                                
                            
                            Text("Temp: \((Double)(forecast.temp), specifier: "%.2f") ºC")
                                .font(.system(size: 25, weight: .medium))
                                
                                .multilineTextAlignment(.center)
                                
                            
                            Text("Humidity: \(forecast.humidity) %")
                                .font(.system(size: 25, weight: .medium))
                                
                                .multilineTextAlignment(.center)
                                
                            
                            Text("Pressure: \(forecast.pressure) hpa")
                                .font(.system(size: 25, weight: .medium))
                                
                                .multilineTextAlignment(.center)
                                
                            
                            Text("WindSpeed: \(String(format: "%2.f", forecast.windSpeed)) mph")
                                .font(.system(size: 25, weight: .medium))
                                
                                
                        }
                            
                        Spacer()
                        
                        
                        

                    } else {
                        Spacer()
                        VStack(alignment: .leading){
                            // images in here
                            Image(systemName: "cloud.fill")
                            //                                .resizable().frame(width: 50, height: 50)
                            .frame(width: 50, height: 50)
                            
                            Image("temperature")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Image("humidity").resizable().frame(width: 50, height: 50)
                            Image("pressure")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .leading)
                            
                            Image("windSpeed").resizable().frame(width: 50, height: 50)
                            
                        }
                        
                        VStack(alignment: .center, spacing:30){
                            // texts
                            Text("No weather data")
                                .font(.system(size: 25, weight: .medium))
                                .multilineTextAlignment(.center)
                                
                            
                            Text("Temp: \((Double)(0.0), specifier: "%.2f") ºC")
                                .font(.system(size: 25, weight: .medium))
                                .multilineTextAlignment(.center)
                                
                            
                            Text("Humidity: ")
                                .font(.system(size: 25, weight: .medium))
                                .multilineTextAlignment(.center)
                                
                            
                            Text("Pressure: ")
                                .font(.system(size: 25, weight: .medium))
                                .multilineTextAlignment(.center)
                                
                            
                            Text("WindSpeed: ")
                                .font(.system(size: 25, weight: .medium))
                                .multilineTextAlignment(.center)
                                
                        }
                        
                        
                        Spacer()

                    }
                }
                .padding()
                
                
            }// VS1
            .offset(y: -100)
            
            
        }
        
        
    } //View
    
    func loadWeatherData() {
        Task {
            do {
                // Write code to process user change of location
                isLoading = true
                
                // Calling function to load data for the new location
                try await weatherMapViewModel.getCoordinatesForCity()
                
                // Loading weather data for the new location
                let weatherData = try await weatherMapViewModel.loadData(lat: weatherMapViewModel.coordinates?.latitude ?? 0.0, lon: weatherMapViewModel.coordinates?.longitude ?? 0.0)
                
                // Handling the loaded weather data
                print("Weather data reloaded: \(String(describing: weatherData.timezone))")
                isLoading = false
                
            } catch {
                // Handle other errors
                print("Error: \(error)")
                isLoading = false
            }
            
        }
    }
}

