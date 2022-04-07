//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Jae-hoon Sim on 2022/04/05.
//

import UIKit

class ViewController: UIViewController {

    private var currentWeatherStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.backgroundColor = .systemGray6

        stackView.layer.borderColor = UIColor.black.cgColor
        stackView.layer.borderWidth = 0.2
        stackView.layer.shadowColor = UIColor.systemGray4.cgColor
        stackView.layer.shadowOpacity = 0.5
        stackView.layer.cornerRadius = 10

        return stackView
    }()

    private var weatherDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    private var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    private var feelsLikeLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .largeTitle)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        CurrentWeatherUseCase(
            currentWeatherRepository: DefaultCurrentWeatherRepository(
                currentWeatherNetworkAPIService: DefaultCurrentWeatherAPIService()
            )
        )
            .fetch { data in
                DispatchQueue.main.async {
                    self.weatherDescriptionLabel.text = data.description
                    self.temperatureLabel.text = String(data.temp)
                    self.feelsLikeLabel.text = String(data.feelsLike)
                }
            }

    }
}

private extension ViewController {
    func config() {
        setHierarchy()
        setConstraint()
    }

    func setHierarchy() {
        self.view.addSubview(self.currentWeatherStackView)

        self.currentWeatherStackView.addArrangedSubview(self.weatherDescriptionLabel)
        self.currentWeatherStackView.addArrangedSubview(self.temperatureLabel)
        self.currentWeatherStackView.addArrangedSubview(self.feelsLikeLabel)
    }

    func setConstraint() {
        self.currentWeatherStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.currentWeatherStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30.0),
            self.currentWeatherStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30.0),
            self.currentWeatherStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            self.currentWeatherStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -500.0)
        ])
    }
}
