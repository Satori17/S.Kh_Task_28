//
//  CurrentForecastDataSource.swift
//  S.Kh_Task_28
//
//  Created by Saba Khitaridze on 31.08.22.
//

import UIKit
import CoreLocation

final class CurrentForecastDataSource: NSObject {
    
    //MARK: - Properties
    
    private var viewModel: CurrentForecastViewModelProtocol?
    private let locationManager = CLLocationManager()
    private var currentLocation: CLLocation!
    
    var forecastHandler: ((ForecastModel) -> Void)?
    
    init(viewModel: CurrentForecastViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
        setupLocation()
        checkCurrentPermission()
    }
}

extension CurrentForecastDataSource: CLLocationManagerDelegate {
    
    //requesting location
    private func setupLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    //checking current location permissions
    private func checkCurrentPermission() {
        let manager = CLLocationManager()
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            print("permission granted")
        case .notDetermined:
            break
        case .denied, .restricted:
            print("permission denied")
        @unknown default:
            print("Location services are unavailable")
        }
    }
    
    //checking global location permissions
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted, .denied:
            print("global permission denied")
        case .authorizedWhenInUse, .authorizedAlways:
            print("global permission granted")
        case .notDetermined:
            break
        @unknown default:
            print("Location services are unavailable")
        }
    }
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            viewModel?.getCurrentForecast(lat: lat, lon: lon, completion: { forecast in
                self.forecastHandler?(forecast)
            })
        }
    }
}
