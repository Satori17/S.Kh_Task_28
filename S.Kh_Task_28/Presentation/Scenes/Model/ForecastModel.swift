//
//  ForecastModel.swift
//  S.Kh_Task_28
//
//  Created by Saba Khitaridze on 31.08.22.
//

import UIKit

struct ForecastModel {
    private var forecast: ForecastData
    
    init(forecast: ForecastData) {
        self.forecast = forecast
    }
    
    var weatherIcon: String {
        let currentWeather = forecast.weather[0]
        return currentWeather.weatherIconId
    }
    
    var chanceOfRain: String {
        "\(Int(forecast.chanceOfRain * 100))%"
    }
    
    var windSpeed: String {
        return "\(String(format: "%.1f", forecast.wind.windSpeed)) km/h"
    }
    
    var windDirection: String {
        switch forecast.wind.windDirection {
        case 0...11:
            return "N"
        case 11...33:
            return "NNE"
        case 33...56:
            return "NE"
        case 56...78:
            return "ENE"
        case 78...101:
            return "E"
        case 101...123:
            return "ESE"
        case 123...146:
            return "SE"
        case 146...168:
            return "SSE"
        case 168...191:
            return "S"
        case 191...213:
            return "SSW"
        case 213...236:
            return "SW"
        case 236...258:
            return "WSW"
        case 258...281:
            return "W"
        case 281...303:
            return "WNW"
        case 303...326:
            return "NW"
        case 326...348:
            return "NNW"
        case 348...360:
            return "N"
        default:
            return "_"
        }
    }
    
    var temperature: String {
        let weatherCondition = forecast.weather[0].condition
        return "\(String(format: "%.0f", forecast.mainDetails.temp))° | \(weatherCondition)"
    }
    
    var humidity: String {
        "\(forecast.mainDetails.humidity)%"
    }
    
    var pressure: String {
        "\(forecast.mainDetails.pressure) hPa"
    }
    
    var time: String {
        "\(forecast.currentTime.dropFirst(11).dropLast(3))"
    }
    
    var date: String {
        "\(forecast.currentTime.dropLast(9))"
    }
    
}
