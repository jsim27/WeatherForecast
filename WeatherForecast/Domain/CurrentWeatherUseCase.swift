//
//  CurrentWeatherUseCase.swift
//  WeatherForecast
//
//  Created by Jae-hoon Sim on 2022/04/05.
//

import Foundation

class CurrentWeatherUseCase {

    func fetch(completion: (CurrentWeather) -> Void) {
        // request 만들어서 레포에 요청, 결과를 가져와서 파싱하여 반환

        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=37.348425399999996&lon=126.92938338827679&appid=27fff19da56816e20ef91dbd2785d65a&lang=&units=metric")!
        let request = URLRequest(url: url)

        URLSession(configuration: .default).dataTask(with: request) { data, response, error in
            guard error != nil else { return }

            
        }

    }
}

protocol CurrentWeatherAPIService {
    func get(completion: @escaping () -> Void)
}
