//
//  WeekForecastDataSource.swift
//  S.Kh_Task_28
//
//  Created by Saba Khitaridze on 31.08.22.
//

import UIKit

final class WeekForecastDataSource: NSObject {
    
    //MARK: - Properties
    
    private var tableView: UITableView
    private var viewModel: WeekForecastViewModelProtocol?
    private var weekForecast: [ForecastModel] = []
    private var filteredWeekForecasts: [[ForecastModel]] {
        let forecastByWeek: [[ForecastModel]] = weekForecast.reduce(into: []) {
            if $0.last?.last?.date == $1.date {
                $0[$0.index(before: $0.endIndex)].append($1)
            } else {
                $0.append([$1])
            }
        }
        return forecastByWeek
    }
    
    init(tableView: UITableView, viewModel: WeekForecastViewModelProtocol) {
        self.tableView = tableView
        self.viewModel = viewModel
        super.init()
        setUpDelegates()
    }
    
    private func setUpDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func loadForecast() {
        viewModel?.getWeekForecast(completion: { data in
            self.weekForecast = data
        })
        self.tableView.reloadData()
    }
    
    private func displayWeekDay(ofSection section: Int) -> String? {
        let dates = Set(filteredWeekForecasts.flatMap{ $0 }.map{ $0.date }).sorted()
        let date = DateTransformer.transformDate(currentDate: dates[section])
        
        return date.dayOfTheWeek()
    }
}


extension WeekForecastDataSource: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        filteredWeekForecasts.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredWeekForecasts[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ForecastCell
        let currentForecast = filteredWeekForecasts[indexPath.section][indexPath.row]
        cell.configure(with: currentForecast)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = HeaderView()
        if let weekDay = displayWeekDay(ofSection: section) {
            view.setupWeekDaysLabel(weekDay)
        }
        
        return view
    }
}
