//
//  CurrentWeather.swift
//  WeatherForecast
//
//  Created by Jae-hoon Sim on 2022/04/06.
//

import Foundation

struct CurrentWeather {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let description: String
    let iconID: String
}

extension CurrentWeather {
    init?(from response: CurrentWeatherResponse) {
        self.temp = response.detailInfo.temp
        self.feelsLike = response.detailInfo.feelsLike
        self.tempMin = response.detailInfo.tempMin
        self.tempMax = response.detailInfo.tempMax
        guard let weather = response.weather.first else {
            return nil
        }
        self.description = weather.weatherDescription
        self.iconID = weather.icon
    }
}
