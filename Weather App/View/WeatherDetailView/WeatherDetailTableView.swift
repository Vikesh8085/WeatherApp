//
//  WeatherDetailTableView.swift
//  Weather App
//
//  Created by macbook on 15/01/22.
//


import UIKit

final class WeatherDetailTableView: UITableView {
    
    var dataModel: WeatherModel?

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
        self.separatorStyle = .none
        
        register(WeatherDetailTimeCell.nib, forCellReuseIdentifier: WeatherDetailTimeCell.identifier)
        register(WeatherDetailCell.nib, forCellReuseIdentifier: WeatherDetailCell.identifier)
        register(WeatherGeneralCell.nib, forCellReuseIdentifier: WeatherGeneralCell.identifier)
        
        sectionFooterHeight = 0
        if #available(iOS 15.0, *) {
            sectionHeaderTopPadding = 0
        } else {
            // Fallback on earlier versions
        }
    }
    
}

extension WeatherDetailTableView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return self.getTimeCell(indexPath)
        case 1:
            return self.getDetailCell(indexPath)
        case 2,3,4,5:
            return self.getGeneralCell(indexPath)
        default:
            return UITableViewCell()
        }
    }
    
    private func getTimeCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let referCell = self.dequeueReusableCell(withIdentifier: WeatherDetailTimeCell.identifier, for: indexPath) as? WeatherDetailTimeCell else {
            return UITableViewCell()
        }
        referCell.selectionStyle = .none
        return referCell
    }
    
    private func getDetailCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let referCell = self.dequeueReusableCell(withIdentifier: WeatherDetailCell.identifier, for: indexPath) as? WeatherDetailCell else {
            return UITableViewCell()
        }
        referCell.selectionStyle = .none
        return referCell
    }
    
    private func getGeneralCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let referCell = self.dequeueReusableCell(withIdentifier: WeatherGeneralCell.identifier, for: indexPath) as? WeatherGeneralCell else {
            return UITableViewCell()
        }
        referCell.selectionStyle = .none
        return referCell
    }

}
