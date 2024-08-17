//
//  DailyWeatherCollectionViewCellViewModel.swift
//  WeatherAPP
//
//  Created by Prasanth Podalakur on 17/08/24.
//

import Foundation
struct DailyWeatherCollectionViewCellViewModel {
    private let model: DayWeather

    init(model: DayWeather) {
        self.model = model
    }

    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        return formatter
    }()

    public var iconName: String {
        return model.symbolName
    }

    public var temperature: String {
        return "\(string(for: model.lowTemperature)) – \(string(for: model.highTemperature))"
    }

    private func string(for temp: Measurement<UnitTemperature>) -> String {
        return "\(Int(temp.converted(to: .fahrenheit).value)) °F"
    }

    public var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dayName = dateFormatter.string(from: model.date)
       return dayName
    }
}

struct DayWeather: Codable {
    let symbolName: String
    /// The daytime high temperature.
    public var highTemperature: Measurement<UnitTemperature>

    /// The overnight low temperature.
    public var lowTemperature: Measurement<UnitTemperature>
    var date: Date

}
