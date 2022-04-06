//
//  CurrentWeatherRequest.swift
//  WeatherForecast
//
//  Created by Jae-hoon Sim on 2022/04/06.
//

import Foundation

struct CurrentWeatherRequestParams {
    let latitude: Double
    let longitude: Double
    let language: String?
    let units: String?
}

extension CurrentWeatherRequestParams {

    var toPath: String {
        var path = ""

        path.append("lat=\(String(self.latitude))")
        path.append("&lon=\(String(self.longitude))")
        path.append("&lang=\(self.language ?? "")")
        path.append("&units=\(self.units ?? "")")

        return path
    }
}
