//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Sagar Sharma on 31/10/24.
//

import SwiftUI
import CoreLocation

final class WeatherViewModel: ObservableObject {
    
    @Published var weather: Weather?
    @Published var city = Constants.Strings.city {
        didSet {
            getLocation()
        }
    }

    init() {
        getLocation()
    }

    private func getLocation() {
        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
            if let places = placemarks,
               let place = places.first {
                self.getWeather(coord: place.location?.coordinate)
            }
        }
    }

    private func getWeather(coord: CLLocationCoordinate2D?) {
        var urlString = ""
        if let coord = coord {
            urlString = WeatherApi.getCurrentWeatherURL(latitude: coord.latitude, longitude: coord.longitude)
        } else {
            urlString = WeatherApi.getCurrentWeatherURL(latitude: 40.2214, longitude: 74.7714)
        }
        getWeatherInternal(city: city, for: urlString)
    }

    private func getWeatherInternal(city: String, for urlString: String) {
        guard let url = URL(string: urlString) else {return}
        NetworkManager<Weather>.fetchWeather(for: url) { (result) in
            switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self.weather = response
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }

    var weatherIcon: String {
        return weather?.weatherDetail.first?.icon ?? "sun"
    }

    var temperature: String {
        return getTempFor(weather?.main.temp ?? 0.0)
    }

    var conditions: String {
        return weather?.weatherDetail.first?.main ?? ""
    }

    var windSpeed: String {
        return String(format: "%0.1f", weather?.wind.speed ?? 0)
    }

    var humidity: String {
        return String(format: "%d%%", weather?.main.humidity ?? 0)
    }

    var rainChances: String {
        return String(format: "%0.1f%%", weather?.main.temp ?? 0)
    }

    func getTempFor(_ temp: Double) -> String {
        return String(format: "%1.0f", temp)
    }
    
    func getWeatherIconFor(icon: String) -> Image {
        switch icon {
            case "01d":
                return Image("sun")
            case "01n":
                return Image("moon")
            case "02d":
                return Image("cloudSun")
            case "02n":
                return Image("cloudMoon")
            case "03d":
                return Image("cloud")
            case "03n":
                return Image("cloudMoon")
            case "04d":
                return Image("cloudMax")
            case "04n":
                return Image("cloudMoon")
            case "09d":
                return Image("rainy")
            case "09n":
                return Image("rainy")
            case "10d":
                return Image("rainySun")
            case "10n":
                return Image("rainyMoon")
            case "11d":
                return Image("thunderstormSun")
            case "11n":
                return Image("thunderstormMoon")
            case "13d":
                return Image("snowy")
            case "13n":
                return Image("snowy-2")
            case "50d":
                return Image("tornado")
            case "50n":
                return Image("tornado")
            default:
                return Image("sun")
        }
    }
}
