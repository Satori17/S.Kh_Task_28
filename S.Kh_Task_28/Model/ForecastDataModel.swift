//
//  ForecastDataModel.swift
//  S.Kh_Task_28
//
//  Created by Saba Khitaridze on 30.08.22.
//

import UIKit

struct AllForecast: Decodable {
    let list: [ForecastData]
    let city: City
}

//Data
struct ForecastData: Decodable {
    let mainDetails: Main
    let weather: [WeatherCondition]
    let wind: Wind
    let chanceOfRain: Double
    let currentTime: String
    
    private enum CodingKeys: String, CodingKey {
        case mainDetails = "main"
        case weather
        case wind
        case chanceOfRain = "pop"
        case currentTime = "dt_txt"
    }
}

//Main
struct Main: Decodable {
    let temp: Double
    let pressure: Int
    let humidity: Int
}

//Condition
struct WeatherCondition: Decodable  {
    let condition: String
    let weatherIconId: String
    
    private enum CodingKeys: String, CodingKey {
        //case weatherIcon = "id"
        case condition = "description"
        case weatherIconId = "icon"
    }
}

//Wind
struct Wind: Decodable {
    let windSpeed: Double
    let windDirection: Int
    
    private enum CodingKeys: String, CodingKey {
        case windSpeed = "speed"
        case windDirection = "deg"
    }
}

//City
struct City: Decodable {
    var name: String
    let country: String
}
