//
//  CurrentWeatherAPIService.swift
//  WeatherForecast
//
//  Created by Jae-hoon Sim on 2022/04/06.
//

import Foundation

protocol CurrentWeatherAPIService: AnyObject {
    func get(params: CurrentWeatherRequestParams, completion: @escaping (CurrentWeatherResponse) -> Void)
}

class DefaultCurrentWeatherAPIService: CurrentWeatherAPIService, CurrentWeatherAPIInfoHolder {

    func get(params: CurrentWeatherRequestParams, completion: @escaping (CurrentWeatherResponse) -> Void) {
        let url = URL(string: baseURLPath + params.toPath + "&appid=\(self.appID)")!
        let request = URLRequest(url: url)

        URLSession(configuration: .default).dataTask(with: request) { data, response, error in
            guard error == nil else { return }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else { return }

            guard let result = try? JSONDecoder().decode(CurrentWeatherResponse.self, from: data!) else {
                return
            }

            completion(result)
        }
        .resume()
    }
}
