//
//  HourlyWeatherCollectionViewCellViewModel.swift
//  WeatherAPP
//
//  Created by Prasanth Podalakur on 17/08/24.
//

import Foundation
struct HourlyWeatherCollectionViewCellViewModel {
    private let model: HourWeather


    init(model: HourWeather) {
        self.model = model
    }

    public var iconName: String {
        return model.symbolName ?? ""
    }

    public var temperature: String {
        return "\(Int(model.temperature.converted(to: .fahrenheit).value)) °F"
    }

    public var hour: String {
        let hour = Calendar.current.component(.hour, from: model.date)
        return "\(hour):00"
    }
}
struct HourWeather {
    let symbolName: String?
    var temperature: Measurement<UnitTemperature>
    var date: Date
}
