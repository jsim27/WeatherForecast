//
//  CurrentWeather.swift
//  WeatherForecast
//
//  Created by Jae-hoon Sim on 2022/04/05.
//

import Foundation

// MARK: - CurrentWeather
struct CurrentWeather: Codable {
    let weather: [Weather]
    let detailInfo: Weather.DetailInfo

    enum CodingKeys: String, CodingKey {
        case weather
        case detailInfo = "main"
    }
}
