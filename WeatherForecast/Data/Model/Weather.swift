//
//  Weather.swift
//  WeatherForecast
//
//  Created by Jae-hoon Sim on 2022/04/05.
//

import Foundation

// MARK: - Weather
struct Weather: Codable {

    struct DetailInfo: Codable {
        let temp: Double
        let feelsLike: Double
        let tempMin: Double
        let tempMax: Double
        let pressure: Int
        let humidity: Int

        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case pressure, humidity
        }
    }

    let id: Int
    let main: String
    let weatherDescription: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}
