//
//  UIImageView+Extension.swift
//  S.Kh_Task_28
//
//  Created by Saba Khitaridze on 30.08.22.
//

import UIKit

extension UIImageView {
    
    func loadImage(urlString: String) {
        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: urlString) else { return }
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
