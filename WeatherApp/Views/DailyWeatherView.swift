//
//  DailyWeatherView.swift
//  CWK2Template
//
//  Created by girish lukka on 02/11/2023.
//

import SwiftUI

struct DailyWeatherView: View {
    var day: Daily
    var body: some View {
        // format the date using the formattedDateWithWeekDay function from the dateFormatterUtils
        let formattedDate = DateFormatterUtils.formattedDateWithWeekdayAndDay(from: TimeInterval(day.dt))
            
        HStack{
            HStack{
                AsyncImage(url: URL(string:"https://openweathermap.org/img/wn/\(day.weather[0].icon)@2x.png")){ image in
                    image
                        .resizable()
                }placeholder: {
                    Color.gray
                }
                .frame(width: 50, height: 50)
                .padding()
            }
            Spacer()
            
            
            VStack(){
                Text(day.weather[0].main.rawValue)
                    .multilineTextAlignment(.leading)
                Text(formattedDate)
                    .font(.body)
            }
            Spacer()
            
            
            
            VStack(alignment: .leading){
                Text("\(day.temp.max, specifier: "%.2f") ºC / \(day.temp.min, specifier: "%.2f") ºC")
                    .multilineTextAlignment(.leading)
            }
        }

        .background(Image(.background)
            .resizable()
            .scaledToFill()
            .clipped()
            .opacity(0.1))
            
        
        
        
        
    }
}

