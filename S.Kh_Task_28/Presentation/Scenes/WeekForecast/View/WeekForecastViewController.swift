//
//  WeekForecastViewController.swift
//  S.Kh_Task_28
//
//  Created by Saba Khitaridze on 31.08.22.
//

import UIKit


class WeekForecastViewController: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var forecastTableView: UITableView!
    
    //MARK: - Properties
    
    static var identifier: String { .init(describing: self) }
    var viewModel: WeekForecastViewModelProtocol!
    var dataSource: WeekForecastDataSource!
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forecastTableView.registerNib(class: ForecastCell.self)
        setupViewModel()
        dataSource.loadForecast()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        forecastTableView.reloadData()
    }
    
    //MARK: - Methods
    
    private func setupViewModel() {        
        dataSource = WeekForecastDataSource(tableView: forecastTableView, viewModel: viewModel)
    }

}
