//
//  Weather.swift
//  Weather
//
//  Created by Sagar Sharma on 31/10/24.
//

import Foundation

struct Weather: Codable, Identifiable {
    var date: Int
    var name: String
    var cod, visibility, timezone: Int
    var sys: Sys
    var wind: Wind
    var main: Main
    var weatherDetail: [WeatherDetail]
    var coord : Coordinate
    var id: UUID {
        UUID()
    }

    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case name = "name"
        case sys = "sys"
        case weatherDetail = "weather"
        case coord = "coord"
        case main = "main"
        case wind = "wind"
        case cod = "cod"
        case visibility = "visibility"
        case timezone = "timezone"
    }

    init() {
        date = 0
        name = ""
        cod = 0
        visibility = 0
        timezone = 0
        sys = Sys(type: 0, id: 0, sunrise: 0, sunset: 0, country: "")
        main = Main(temp: 0.0, temp_min: 0.0, temp_max: 0.0, feels_like: 0.0, pressure: 0, humidity: 0, sea_level: 0, grnd_level: 0)
        wind = Wind(speed: 0.0, deg: nil, gust: nil)
        weatherDetail = []
        coord = Coordinate(lat: 0.0, lon: 0.0)
    }
}


struct Coordinate: Codable {
    let lat, lon : Double
}

struct WeatherDetail: Codable, Identifiable {
    var main: String
    var description: String
    var icon: String
    var id: Int {
        0
    }
}

struct Main : Codable {
    let temp, temp_min, temp_max, feels_like : Double
    let pressure, humidity, sea_level, grnd_level : Int
}

struct Wind : Codable {
    let speed : Double
    let deg : Double?
    let gust : Double?
}

struct Sys : Codable {
    let type, id : Int
    let sunrise, sunset : Int
    let country : String
}
