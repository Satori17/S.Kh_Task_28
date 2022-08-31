//
//  BaseUrl.swift
//  S.Kh_Task_28
//
//  Created by Saba Khitaridze on 30.08.22.
//

import UIKit

let apikey = "5730e0ce7556759fedf4539f6ea80c40"

protocol DataUrl {
    var urlString: String { get }
    func withBaseUrl()
}

enum Units: String {
    case celsius = "metric"
}


enum BaseUrl: String {
    case forecastUrl = "https://api.openweathermap.org/data/2.5/forecast?"
    case iconUrl = "https://openweathermap.org/img/wn/"
}
