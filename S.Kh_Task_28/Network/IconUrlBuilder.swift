//
//  IconUrlBuilder.swift
//  S.Kh_Task_28
//
//  Created by Saba Khitaridze on 31.08.22.
//

import UIKit

class IconUrlBuilder: DataUrl {
    
    var urlString: String
    
    func withBaseUrl() {
        self.urlString = BaseUrl.iconUrl.rawValue
    }
    
    private func withIcon(id: String) {
        self.urlString += id
    }
    
    private func withExtension() {
        self.urlString += ".png"
    }
    
    
    init(withId id: String) {
        self.urlString = ""
        withBaseUrl()
        withIcon(id: id)
        withExtension()
    }
    
}
