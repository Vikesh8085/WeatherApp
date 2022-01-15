//
//  WeatherTableView.swift
//  Weather App
//
//  Created by macbook on 15/01/22.
//


import UIKit

final class WeatherTableView: UITableView {
    
    var weatherForcast: ForeCastModel? {
        didSet {
            reloadData()
        }
    }
    var weatherTapped:((WeatherModel?) -> Void)?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configTableView()
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        configTableView()
    }
    
    deinit {
        print("\(self) table page deallocated")
    }
 
    
    // MARK: - Private methods
    
    private func configTableView() {
        self.delegate = self
        self.dataSource = self
        self.showsVerticalScrollIndicator = false
        
        register(WeatherListCell.nib, forCellReuseIdentifier: WeatherListCell.identifier)
        register(WeatherListHeaderView.nib, forHeaderFooterViewReuseIdentifier: WeatherListHeaderView.identifier)
        sectionFooterHeight = 0
        if #available(iOS 15.0, *) {
            sectionHeaderTopPadding = 0
        } else {
            // Fallback on earlier versions
        }
    }
    
}

extension WeatherTableView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: WeatherListHeaderView.identifier) as? WeatherListHeaderView {
            headerView.backgroundColor = .white
            headerView.setData(data: self.weatherForcast?.city)
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.weatherForcast?.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.getListCell(indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        weatherTapped?(self.weatherForcast?.list?[indexPath.row])
    }
    private func getListCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let referCell = self.dequeueReusableCell(withIdentifier: WeatherListCell.identifier, for: indexPath) as? WeatherListCell else {
            return UITableViewCell()
        }
        referCell.setData(data: self.weatherForcast?.list?[indexPath.row])
        referCell.selectionStyle = .none
        return referCell
    }

}
