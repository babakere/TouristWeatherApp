//
//  HourWeatherView.swift
//  CWK2Template
//
//  Created by girish lukka on 02/11/2023.
//

import SwiftUI
// displays hourly weather information
struct HourWeatherView: View {
    @EnvironmentObject var weatherMapViewModel: WeatherMapViewModel
    var current: Current

    var body: some View {
        // format the date using FormattedDateWithDay function from the DateFormatterUtils
        let timestamp = TimeInterval(current.dt ?? 0)
        let formattedDate = DateFormatterUtils.formattedDateWithDay(from: timestamp)
        ZStack{
            Color.mint
            VStack(alignment: .center, spacing: 5) {
                //Display the formatted date
                Text(formattedDate)
                    .font(.body)
                    .padding(.horizontal)
                    
                    .foregroundColor(.black)
                // placeholder for additional styling and other elements
                AsyncImage(url: URL(string:"https://openweathermap.org/img/wn/\(current.weather[0].icon)@2x.png")){ image in
                    image
                        .resizable()
                }placeholder: {
                    Color.gray
                }
                .frame(width: 50, height: 50)
                    
                
                
                Text("Temp: \((Double)(current.temp), specifier: "%.2f") ºC")
                    
                Text(current.weather[0].main.rawValue)
                    
            }.font(.system(size: 15))
                
            .padding()
                

        }.cornerRadius(15)
                
    }
}





