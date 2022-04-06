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

protocol CurrentWeatherRepository {
    func fetch(completion: @escaping (CurrentWeather) -> Void)
}

class DefaultCurrentWeatherRepository: CurrentWeatherRepository {
    private let currentWeatherNetworkAPIService: CurrentWeatherAPIService

    init(currentWeatherNetworkAPIService: CurrentWeatherAPIService) {
        self.currentWeatherNetworkAPIService = currentWeatherNetworkAPIService
    }

    func fetch(completion: @escaping (CurrentWeather) -> Void) {
        // request 만들어서 레포에 요청, 결과를 가져와서 파싱하여 반환
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
