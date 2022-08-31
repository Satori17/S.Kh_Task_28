//
//  ForecastView.swift
//  S.Kh_Task_28
//
//  Created by Saba Khitaridze on 31.08.22.
//

import UIKit

protocol nextWeekForecastDelegate: AnyObject {
    func showNextWeekForecast()
}

class ForecastView: UIView {
    
    //MARK: - IBOutlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var IconImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var chanceOfRainLabel: UILabel!
    @IBOutlet weak var windDirectionLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var nextWeekForecastBtn: UIButton!
    //background views
    @IBOutlet weak var humidityView: UIView!
    @IBOutlet weak var windView: UIView!
    @IBOutlet weak var rainView: UIView!
    @IBOutlet weak var compassView: UIView!
    @IBOutlet weak var pressureView: UIView!
    
    //MARK: - Properties
    
    weak var delegate: nextWeekForecastDelegate?
    
    //MARK: - Object Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubviews()
    }
    
    //MARK: - IBAction
    
    @IBAction func nextWeekForecastTapped(_ sender: UIButton) {
        delegate?.showNextWeekForecast()
    }
    
    
    //MARK: - Methods
    
    private func initSubviews() {
        let nib = UINib(nibName: "ForecastView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        contentView.clipsToBounds = true
        setuCornerRadius()
        addSubview(contentView)
    }
    
    private func setuCornerRadius() {
        nextWeekForecastBtn.layer.cornerRadius = 15
        humidityView.layer.cornerRadius = 15
        windView.layer.cornerRadius = 15
        rainView.layer.cornerRadius = 15
        compassView.layer.cornerRadius = 15
        pressureView.layer.cornerRadius = 15
    }
    
    func configure(with forecast: ForecastModel) {
        IconImageView.loadImage(urlString: IconUrlBuilder(withId: forecast.weatherIcon).urlString)
        temperatureLabel.text = forecast.temperature
        humidityLabel.text = forecast.humidity
        windSpeedLabel.text = forecast.windSpeed
        chanceOfRainLabel.text = forecast.chanceOfRain
        windDirectionLabel.text = forecast.windDirection
        pressureLabel.text = forecast.pressure
    }
}
