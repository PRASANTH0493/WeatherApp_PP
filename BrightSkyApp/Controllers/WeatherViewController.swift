//
//  ViewController.swift
//  WeatherAPP
//
//  Created by Prasanth Podalakur on 10/08/24.
//

import UIKit

class WeatherViewController: UIViewController, CurrentWeatherViewProtocol {
    
    private let primaryView = CurrentWeatherView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        view.backgroundColor = .systemBackground
        view.addSubview(primaryView)
        primaryView.delegate = self
        NSLayoutConstraint.activate([
            primaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            primaryView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            primaryView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            primaryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        getLocation()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "crown"),
                                                            style: .done,
                                                            target: self,
                                                                  action: #selector(self.didTapUpgrade))
    }
    
    func getLocation() {
        DispatchQueue.main.async {
            self.primaryView.configure(with: [
                .current(viewModel: .init(model: CurrentWeather(condition: WeatherCondition.allCases.randomElement()?.rawValue,
                                                                temperature: Measurement(value: 25,
                                                                                         unit: UnitTemperature.celsius),
                                                                symbolName: "cloud.moon.rain"))),
                .hourly(viewModels: self.createHourlyModel()),
                .daily(viewModels: self.createDayWeatherModel())
            ])
           
        }
    }
    
    @objc
    private func didTapUpgrade() {
        getLocation()
    }
    func collectionView(didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt---didSelectItemAt")
    }
    
    func createHourlyModel() -> [HourlyWeatherCollectionViewCellViewModel] {
        let item = HourlyWeatherCollectionViewCellViewModel(model: HourWeather(symbolName: "cloud.moon.rain",
                                                                               temperature: Measurement(value: 25,
                                                                                                        unit: UnitTemperature.celsius),
                                                                               date: Date() + 1))
        let item2 = HourlyWeatherCollectionViewCellViewModel(model: HourWeather(symbolName: "cloud.sun.circle.fill",
                                                                                temperature: Measurement(value: 30,
                                                                                                         unit: UnitTemperature.celsius),
                                                                                date: Date() + 1))
        let item3 = HourlyWeatherCollectionViewCellViewModel(model: HourWeather(symbolName: "smoke",
                                                                                temperature: Measurement(value: 15,
                                                                                                         unit: UnitTemperature.celsius),
                                                                                date: Date() + 1))
        let item4 = HourlyWeatherCollectionViewCellViewModel(model: HourWeather(symbolName: "cloud.sun.bolt.circle",
                                                                                temperature: Measurement(value: 18,
                                                                                                         unit: UnitTemperature.celsius),
                                                                                date: Date() + 1))
        let item5 = HourlyWeatherCollectionViewCellViewModel(model: HourWeather(symbolName: "cloud.sun.bolt.fill",
                                                                                temperature: Measurement(value: 20,
                                                                                                         unit: UnitTemperature.celsius),
                                                                                date: Date() + 1))
        let item6 = HourlyWeatherCollectionViewCellViewModel(model: HourWeather(symbolName: "smoke.circle.fill",
                                                                                temperature: Measurement(value: 22,
                                                                                                         unit: UnitTemperature.celsius),
                                                                                date: Date() + 1))
        let item7 = HourlyWeatherCollectionViewCellViewModel(model: HourWeather(symbolName: "cloud.sun.rain.circle",
                                                                                temperature: Measurement(value: 33,
                                                                                                         unit: UnitTemperature.celsius),
                                                                                date: Date() + 1))
        let item8 = HourlyWeatherCollectionViewCellViewModel(model: HourWeather(symbolName: "cloud.moon.fill",
                                                                                temperature: Measurement(value: 35,
                                                                                                         unit: UnitTemperature.celsius),
                                                                                date: Date() + 1))
        let item9 = HourlyWeatherCollectionViewCellViewModel(model: HourWeather(symbolName: "wind.circle.fill",
                                                                                temperature: Measurement(value: 22,
                                                                                                         unit: UnitTemperature.celsius),
                                                                                date: Date() + 1))
        let item10 = HourlyWeatherCollectionViewCellViewModel(model: HourWeather(symbolName: "cloud.moon.bolt.fill",
                                                                                 temperature: Measurement(value: 17,
                                                                                                          unit: UnitTemperature.celsius),
                                                                                 date: Date() + 1))
        let item11 = HourlyWeatherCollectionViewCellViewModel(model: HourWeather(symbolName: "cloud.moon.circle",
                                                                                 temperature: Measurement(value: 09,
                                                                                                          unit: UnitTemperature.celsius),
                                                                                 date: Date() + 1))
        
        return [item, item2, item3, item4, item5, item6, item7, item8, item9, item10, item11]
    }
    
    func createDayWeatherModel() -> [DailyWeatherCollectionViewCellViewModel] {
        let today = Date()
        let item1 = DailyWeatherCollectionViewCellViewModel(model:DayWeather(symbolName: "cloud.moon.rain",
                                                                             highTemperature: Measurement(value: 25,
                                                                                                          unit: UnitTemperature.celsius),
                                                                             lowTemperature: Measurement(value: 25, unit: UnitTemperature.celsius),
                                                                             date: today))
        let item2 = DailyWeatherCollectionViewCellViewModel(model:DayWeather(symbolName: "cloud.moon.circle",
                                                                             highTemperature: Measurement(value: 25,
                                                                                                          unit: UnitTemperature.celsius),
                                                                             lowTemperature: Measurement(value: 25, unit: UnitTemperature.celsius),
                                                                             date: self.getDate(day: 1)))
        let item3 = DailyWeatherCollectionViewCellViewModel(model:DayWeather(symbolName: "cloud.moon.bolt.fill",
                                                                             highTemperature: Measurement(value: 25,
                                                                                                          unit: UnitTemperature.celsius),
                                                                             lowTemperature: Measurement(value: 25, unit: UnitTemperature.celsius),
                                                                             date: self.getDate(day: 2)))
        let item4 = DailyWeatherCollectionViewCellViewModel(model:DayWeather(symbolName: "wind.circle.fill",
                                                                             highTemperature: Measurement(value: 25,
                                                                                                          unit: UnitTemperature.celsius),
                                                                             lowTemperature: Measurement(value: 25, unit: UnitTemperature.celsius),
                                                                             date: self.getDate(day: 3)))
        let item5 = DailyWeatherCollectionViewCellViewModel(model:DayWeather(symbolName: "cloud.moon.fill",
                                                                             highTemperature: Measurement(value: 25,
                                                                                                          unit: UnitTemperature.celsius),
                                                                             lowTemperature: Measurement(value: 25, unit: UnitTemperature.celsius),
                                                                             date: self.getDate(day: 4)))
        let item6 = DailyWeatherCollectionViewCellViewModel(model:DayWeather(symbolName: "smoke.circle.fill",
                                                                             highTemperature: Measurement(value: 25,
                                                                                                          unit: UnitTemperature.celsius),
                                                                             lowTemperature: Measurement(value: 25, unit: UnitTemperature.celsius),
                                                                             date: self.getDate(day: 5)))
        let item7 = DailyWeatherCollectionViewCellViewModel(model:DayWeather(symbolName: "cloud.sun.bolt.fill",
                                                                             highTemperature: Measurement(value: 25,
                                                                                                          unit: UnitTemperature.celsius),
                                                                             lowTemperature: Measurement(value: 25, unit: UnitTemperature.celsius),
                                                                             date: self.getDate(day: 6)))
        return [item1, item2, item3, item4, item5, item6, item7]
    }
    
    func getDate(day: Int) -> Date {
        let today = Date()
        let date = Calendar.current.date(byAdding: .day, value: -day, to: today)
        return date ?? today
    }
}

