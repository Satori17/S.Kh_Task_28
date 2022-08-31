//
//  CurrentForecastManager.swift
//  S.Kh_Task_28
//
//  Created by Saba Khitaridze on 30.08.22.
//

import UIKit

protocol CurrentForecastManagerProtocol: AnyObject {
    func fetchCurrentForecast(withLat lat: Double, lon: Double, completion: @escaping (ForecastData) -> Void)
}

class CurrentForecastManager: CurrentForecastManagerProtocol {
    
    func fetchCurrentForecast(withLat lat: Double, lon: Double, completion: @escaping (ForecastData) -> Void) {
        let urlBuilder = ForecastUrlBuilder(latitude: lat, longitude: lon)
        
        Fetcher.shared.fetchData(withBuilder: urlBuilder.urlString, as: AllForecast.self) { result in
            switch result {
            case .success(let weather):
                completion(weather.list[0])
            case .failure(let error):
                print(error)
            }
        }
    }

}
