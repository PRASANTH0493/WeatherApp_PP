//
//  WeatherViewModel.swift
//  WeatherAPP
//
//  Created by Prasanth Podalakur on 17/08/24.
//

import Foundation
enum WeatherViewModel {
    case current(viewModel: CurrentWeatherCollectionViewCellViewModel)
    case hourly(viewModels: [HourlyWeatherCollectionViewCellViewModel])
    case daily(viewModels: [DailyWeatherCollectionViewCellViewModel])
}
