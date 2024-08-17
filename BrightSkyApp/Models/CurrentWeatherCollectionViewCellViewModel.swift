//
//  CurrentWeatherCollectionViewCellViewModel.swift
//  WeatherAPP
//
//  Created by Prasanth Podalakur on 17/08/24.
//

import Foundation
struct CurrentWeatherCollectionViewCellViewModel {
    private let model: CurrentWeather
    
    init(model: CurrentWeather) {
        self.model = model
    }

    public var condition: String {
        return WeatherCondition(rawValue: model.condition ?? "")?.description ?? ""
    }

    public var temperature: String {
        return "\(Int(model.temperature.converted(to: .fahrenheit).value)) °F"
    }

    public var iconName: String {
        return model.symbolName
    }
}
struct CurrentWeather: Codable {
    let condition: String?
    var temperature: Measurement<UnitTemperature>
    var symbolName: String
}


public enum WeatherCondition : String, CaseIterable, CustomStringConvertible, Hashable {
    public var description: String {
        return self.rawValue
    }
    /// Blizzard.
    case blizzard = "Blizzard."

    /// Blowing dust or sandstorm.
    case blowingDust = "Blowing dust or sandstorm."

    /// Blowing or drifting snow.
    case blowingSnow = "Blowing or drifting snow."

    /// Breezy, light wind.
    case breezy = "Breezy, light wind."

    /// Clear.
    case clear = "Clear."

    /// Cloudy, overcast conditions.
    case cloudy = "Cloudy, overcast conditions."

    /// Drizzle or light rain.
    case drizzle = "Drizzle or light rain."

    /// Flurries or light snow.
    case flurries = "Flurries or light snow."

    /// Fog.
    case foggy = "Fog."

    /// Freezing drizzle or light rain.
    case freezingDrizzle = "Freezing drizzle or light rain."

    /// Freezing rain.
    case freezingRain = "Freezing rain."

    /// Frigid conditions, low temperatures, or ice crystals.
    case frigid = "Frigid conditions, low temperatures, or ice crystals."

    /// Hail.
    case hail = "Hail."

    /// Haze.
    case haze = "Haze."

    /// Heavy rain.
    case heavyRain = "Heavy rain."

    /// Heavy snow.
    case heavySnow = "Heavy snow."

    /// High temperatures.
    case hot = "High temperatures."

    /// Hurricane.
    case hurricane = "Hurricane."

    /// Thunderstorms covering less than 1/8 of the forecast area.
    case isolatedThunderstorms = "Thunderstorms covering less than 1/8 of the forecast area."

    /// Mostly clear.
    case mostlyClear = "Mostly clear."

    /// Mostly cloudy.
    case mostlyCloudy = "Mostly cloudy."

    /// Partly cloudy.
    case partlyCloudy = "Partly cloudy."

    /// Rain.
    case rain = "Rain."

    /// Numerous thunderstorms spread across up to 50% of the forecast area.
    case scatteredThunderstorms = "Numerous thunderstorms spread across up to 50% of the forecast area."

    /// Sleet.
    case sleet = "Sleet."

    /// Smoky.
    case smoky = "Smoky."

    /// Snow.
    case snow = "Snow."

    /// Notably strong thunderstorms.
    case strongStorms = "Notably strong thunderstorms."

    /// Snow flurries with visible sun.
    case sunFlurries = "Snow flurries with visible sun."

    /// Rain with visible sun.
    case sunShowers = "Rain with visible sun."

    /// Thunderstorms.
    case thunderstorms = "Thunderstorms."

    /// Tropical storm.
    case tropicalStorm = "Tropical storm."

    /// Windy.
    case windy = "Windy."

    /// Wintry mix.
    case wintryMix = "Wintry mix."

    public typealias AllCases = [WeatherCondition]

    func callAsFunction() -> String {
        self.rawValue
    }
}
