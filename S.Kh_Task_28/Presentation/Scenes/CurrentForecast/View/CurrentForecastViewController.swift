//
//  CurrentForecastViewController.swift
//  S.Kh_Task_28
//
//  Created by Saba Khitaridze on 30.08.22.
//

import UIKit

final class CurrentForecastViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var currentForecastView: ForecastView!
    
    //MARK: - Properties
    
    private var dataSource: CurrentForecastDataSource!
    private var viewModel: CurrentForecastViewModel!
    private var router: CurrentForecastRouter!
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reload()
    }
    
    //MARK: - Methods
    
    private func setupViewModel() {
        currentForecastView.delegate = self
        viewModel = CurrentForecastViewModel()
        dataSource = CurrentForecastDataSource(viewModel: viewModel)
        router = CurrentForecastRouter()
        viewModel.router = router
        router.viewController = self
    }
    
    private func reload() {
        dataSource.forecastHandler = { [weak self] forecast in
            self?.currentForecastView.configure(with: forecast)
        }
    }
}

extension CurrentForecastViewController: nextWeekForecastDelegate {
    
    func showNextWeekForecast() {
        viewModel.navigateToWeekForecast()
    }
}
