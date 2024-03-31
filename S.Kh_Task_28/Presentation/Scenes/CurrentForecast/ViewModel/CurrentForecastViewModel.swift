//
//  CurrentForecastViewModel.swift
//  S.Kh_Task_28
//
//  Created by Saba Khitaridze on 31.08.22.
//

import UIKit

protocol CurrentForecastViewModelProtocol: AnyObject {
    func getCurrentForecast(lat: Double, lon: Double, completion: @escaping ((ForecastModel) -> Void))
    func navigateToWeekForecast()
}

final class CurrentForecastViewModel: CurrentForecastViewModelProtocol {
    private var currentForecastManager: CurrentForecastManagerProtocol?
    private var fetchCounter = 0
    private var coordinate: (latitude: Double, longitude: Double)?
    
    var router: CurrentForecastRouter?
    
    func getCurrentForecast(lat: Double, lon: Double, completion: @escaping ((ForecastModel) -> Void)) {
        currentForecastManager = CurrentForecastManager()
        
        coordinate = (lat, lon)
        currentForecastManager?.fetchCurrentForecast(withLat: lat, lon: lon, completion: { [weak self] data in
            let currentForecastModel = ForecastModel(forecast: data)
            self?.fetchCounter += 1
            /* preventing double-fetching data with counter (openweathermap does this everytime.
             checkout 'print(currentForecastModel)' method with and without counter variable) */
            guard self?.fetchCounter != 2 else { return }
            DispatchQueue.main.async {
                completion(currentForecastModel)
            }
        })
    }
    
    func navigateToWeekForecast() {
        guard let latitude = coordinate?.latitude,
              let longitude = coordinate?.longitude
        else { return }
        
        router?.routeToWeekForecast(withLat: latitude, lon: longitude)
    }
}
