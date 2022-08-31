//
//  ForecastUrlBuilder.swift
//  S.Kh_Task_28
//
//  Created by Saba Khitaridze on 30.08.22.
//

import UIKit

class ForecastUrlBuilder: DataUrl {
    
    private(set) var urlString: String
    
    func withBaseUrl() {
        self.urlString = BaseUrl.forecastUrl.rawValue
    }
    
    private func withCoordinates(lat: Double, lon: Double) {
        self.urlString += "lat=\(lat)&lon=\(lon)"
    }
    
    private func withApiKey() {
        self.urlString += "&appid=\(apikey)"
    }
    
    private func withUnit() {
        self.urlString += "&units=\(Units.celsius.rawValue)"
    }
    
    init(latitude: Double, longitude: Double) {
        self.urlString = ""
        withBaseUrl()
        withCoordinates(lat: latitude, lon: longitude)
        withApiKey()
        withUnit()
    }
    
}
