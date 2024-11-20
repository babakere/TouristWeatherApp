//
//  WindDirHelper.swift
//  WeatherAirCwk
//
//  Created by GirishALukka on 28/03/2023.
//

import Foundation

// converts degree value to the corresponding cardinal function

func convertDegToCardinal(deg: Int) -> String {
    // array functions showing degrees in 22.5 degree increments
    let cardinalDir = ["N","NNE","NE","ENE","E","ESE","SE","SSE","S","SSW","SW","WSW","W","WNW","NW","NNW","N"]
    
    // calculate index in the cardinalDir array based on the provided degree value and return it 
    return cardinalDir[Int(round(((Double)(deg % 360)) / 22.5).nextDown) + 1]
    
}

