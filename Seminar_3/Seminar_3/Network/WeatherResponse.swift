//
//  WeatherResponse.swift
//  Seminar_3
//
//  Created by 홍유정 on 2023/05/06.
//

struct WeatherResponse: Codable {
    let timezone: Int
    let base: String
    
    let coord: Coordinate
    let weather: [Weather]
}

struct Coordinate: Codable {
    let lon: Float
    let lat: Float
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
