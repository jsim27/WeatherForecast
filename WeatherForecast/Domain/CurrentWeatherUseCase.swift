//
//  CurrentWeatherUseCase.swift
//  WeatherForecast
//
//  Created by Jae-hoon Sim on 2022/04/05.
//

import Foundation

class CurrentWeatherUseCase {
    let currentWeatherRepository: CurrentWeatherRepository

    init(currentWeatherRepository: CurrentWeatherRepository) {
        self.currentWeatherRepository = currentWeatherRepository
    }

    func fetch(completion: @escaping (CurrentWeather) -> Void) {
        currentWeatherRepository.fetch { data in
            completion(data)
        }
    }
}
