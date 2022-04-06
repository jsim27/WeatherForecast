//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Jae-hoon Sim on 2022/04/05.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        CurrentWeatherUseCase(
            currentWeatherRepository: DefaultCurrentWeatherRepository(
                currentWeatherNetworkAPIService: DefaultCurrentWeatherAPIService()
            )
        )
            .fetch { data in
                print(data)
            }
    }
}
