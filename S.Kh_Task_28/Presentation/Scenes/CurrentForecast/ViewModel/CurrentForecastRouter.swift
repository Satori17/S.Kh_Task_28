//
//  CurrentForecastRouter.swift
//  S.Kh_Task_28
//
//  Created by Saba Khitaridze on 31.08.22.
//

import UIKit

protocol CurrentForecastRoutingLogic {
    func routeToWeekForecast(withLat lat: Double, lon: Double)
}

final class CurrentForecastRouter: CurrentForecastRoutingLogic {
    var viewController: CurrentForecastViewController?
    
    func routeToWeekForecast(withLat lat: Double, lon: Double) {
        let weekForecastViewModel = WeekForecastViewModel(lat: lat, lon: lon)
        
        if let destinationVC = UIStoryboard(name: WeekForecastViewController.identifier, bundle: nil).instantiateViewController(withIdentifier: WeekForecastViewController.identifier) as? WeekForecastViewController {
            destinationVC.viewModel = weekForecastViewModel
            viewController?.navigationController?.pushViewController(destinationVC, animated: true)
        }
    }
}
