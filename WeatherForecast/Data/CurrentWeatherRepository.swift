//
//  CurrentWeatherRepository.swift
//  WeatherForecast
//
//  Created by Jae-hoon Sim on 2022/04/06.
//

import Foundation

protocol CurrentWeatherRepository {
    func fetch(completion: @escaping (CurrentWeather) -> Void)
}

class DefaultCurrentWeatherRepository: CurrentWeatherRepository {
    private let currentWeatherNetworkAPIService: CurrentWeatherAPIService

    init(currentWeatherNetworkAPIService: CurrentWeatherAPIService) {
        self.currentWeatherNetworkAPIService = currentWeatherNetworkAPIService
    }

    func fetch(completion: @escaping (CurrentWeather) -> Void) {
        let params = CurrentWeatherRequestParams(
            latitude: 37.348425399999996,
            longitude: 126.92938338827679,
            language: nil,
            units: "metric"
        )
        currentWeatherNetworkAPIService.get(params: params) { response in
            guard let data = CurrentWeather(from: response) else { return }
            completion(data)
        }
    }
}
