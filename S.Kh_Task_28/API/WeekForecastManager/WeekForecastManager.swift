//
//  WeekForecastManager.swift
//  S.Kh_Task_28
//
//  Created by Saba Khitaridze on 30.08.22.
//

import UIKit

protocol WeekForecastManagerProtocol: AnyObject {
    func fetchWeekForecast(completion: @escaping (AllForecast) -> Void)
    
    init(withLat lat: Double, lon: Double)
}

final class WeekForecastManager: WeekForecastManagerProtocol {
    private let lat: Double
    private let lon: Double
    
    required init(withLat lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
    }
    
    func fetchWeekForecast(completion: @escaping (AllForecast) -> Void) {
        let urlBuilder = ForecastUrlBuilder(latitude: self.lat, longitude: self.lon)
        
        Fetcher.shared.fetchData(withBuilder: urlBuilder.urlString, as: AllForecast.self) { result in
            switch result {
            case .success(let weather):
                completion(weather)
            case .failure(let error):
                print(error)
            }
        }
    }
}
