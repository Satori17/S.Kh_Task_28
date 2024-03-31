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

final class WeekForecastViewModel: WeekForecastViewModelProtocol {
    private var weekForecastManager: WeekForecastManagerProtocol?
    private let lat: Double
    private let lon: Double
    
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
