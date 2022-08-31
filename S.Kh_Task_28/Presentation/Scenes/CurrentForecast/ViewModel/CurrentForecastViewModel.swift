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

class CurrentForecastViewModel: CurrentForecastViewModelProtocol {
    var currentForecastManager: CurrentForecastManagerProtocol?
    var router: CurrentForecastRouter?
    var fetchCounter = 0
    
    var latitude: Double!
    var longitude: Double!
    
    func getCurrentForecast(lat: Double, lon: Double, completion: @escaping ((ForecastModel) -> Void)) {
        currentForecastManager = CurrentForecastManager()
        
        latitude = lat
        longitude = lon
        currentForecastManager?.fetchCurrentForecast(withLat: lat, lon: lon, completion: { data in
            let currentForecastModel = ForecastModel(forecast: data)
            self.fetchCounter += 1
            /* preventing double-fetching data with counter (openweathermap does this everytime.
             checkout 'print(currentForecastModel)' method with and without counter variable) */
            guard self.fetchCounter != 2 else { return }
            DispatchQueue.main.async {
                completion(currentForecastModel)
                //print(currentForecastModel)
            }
        })
    }
    
    func navigateToWeekForecast() {
        router?.routeToWeekForecast(withLat: latitude, lon: longitude)
    }
}
