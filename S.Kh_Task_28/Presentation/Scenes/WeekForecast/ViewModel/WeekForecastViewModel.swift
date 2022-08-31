//
//  WeekForecastViewModel.swift
//  S.Kh_Task_28
//
//  Created by Saba Khitaridze on 31.08.22.
//

import UIKit

protocol WeekForecastViewModelProtocol: AnyObject {
    func getWeekForecast(completion: @escaping (([ForecastModel]) -> Void))
    
    init(lat: Double, lon: Double)
}

class WeekForecastViewModel: WeekForecastViewModelProtocol {
    var weekForecastManager: WeekForecastManagerProtocol?
    let lat: Double
    let lon: Double
    
    required init(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
    }
    
    func getWeekForecast(completion: @escaping (([ForecastModel]) -> Void)) {
        weekForecastManager = WeekForecastManager(withLat: lat, lon: lon)
        
        weekForecastManager?.fetchWeekForecast(completion: { data in
            DispatchQueue.main.async {
                let weekForecastModel = data.list.map{ ForecastModel(forecast: $0) }
                completion(weekForecastModel)
            }
        })
    }
    
}
