//
//  CurrentWeather.swift
//  WeatherForecast
//
//  Created by Jae-hoon Sim on 2022/04/05.
//

import Foundation

// MARK: - CurrentWeather
struct CurrentWeatherResponse: Codable {
    let weather: [Weather]
    let detailInfo: Weather.DetailInfo

    enum CodingKeys: String, CodingKey {
        case weather
        case detailInfo = "main"
    }
}

struct CurrentWeather {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let description: String
}

extension CurrentWeather {
    init?(from response: CurrentWeatherResponse) {
        self.temp = response.detailInfo.temp
        self.feelsLike = response.detailInfo.feelsLike
        self.tempMin = response.detailInfo.tempMin
        self.tempMax = response.detailInfo.tempMax
        guard let description = response.weather.first?.weatherDescription else {
            return nil
        }
        self.description = description
    }
}
