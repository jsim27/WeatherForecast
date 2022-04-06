//
//  CurrentWeatherAPIInfoHolder.swift
//  WeatherForecast
//
//  Created by Jae-hoon Sim on 2022/04/06.
//

import Foundation

protocol CurrentWeatherAPIInfoHolder {
    var appID: String { get }
    var baseURLPath: String { get }
}

extension CurrentWeatherAPIInfoHolder {

    var appID: String {
        return "27fff19da56816e20ef91dbd2785d65a"
    }

    var baseURLPath: String {
        return "https://api.openweathermap.org/data/2.5/weather?"
    }
}
