//
//  WeekForecastViewController.swift
//  S.Kh_Task_28
//
//  Created by Saba Khitaridze on 31.08.22.
//

import UIKit

final class WeekForecastViewController: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet private weak var forecastTableView: UITableView!
    
    //MARK: - Properties
    
    static var identifier: String { .init(describing: self) }
    var viewModel: WeekForecastViewModelProtocol?
    var dataSource: WeekForecastDataSource?
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forecastTableView.registerNib(class: ForecastCell.self)
        setupDataSource()
        dataSource?.loadForecast()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        forecastTableView.reloadData()
    }
    
    //MARK: - Methods
    
    private func setupDataSource() {
        guard let viewModel else { return }
        dataSource = WeekForecastDataSource(tableView: forecastTableView, viewModel: viewModel)
    }
}
