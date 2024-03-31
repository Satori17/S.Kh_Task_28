//
//  ForecastCell.swift
//  S.Kh_Task_28
//
//  Created by Saba Khitaridze on 31.08.22.
//

import UIKit

final class ForecastCell: UITableViewCell {

    //MARK: - IBOutlets
    
    @IBOutlet private weak var forecastIconImageView: UIImageView!
    @IBOutlet private weak var forecastTimeLabel: UILabel!
    @IBOutlet private weak var forecastConditionLabel: UILabel!
    
    //MARK: - Cell Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    //MARK: - Methods
    
    func configure(with forecast: ForecastModel) {
        forecastIconImageView.loadImage(urlString: IconUrlBuilder(withId: forecast.weatherIcon).urlString)
        forecastTimeLabel.text = forecast.time
        forecastConditionLabel.text = forecast.temperature
    }
}
