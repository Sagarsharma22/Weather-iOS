//
//  WeatherViewModelTests.swift
//  WeatherTests
//
//  Created by Sagar Sharma on 31/10/24.
//

import XCTest
import Combine
import CoreLocation
@testable import Weather

final class WeatherViewModelTests: XCTestCase {
    
    var weatherViewModel: WeatherViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        weatherViewModel = WeatherViewModel()
        cancellables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        weatherViewModel = nil
        cancellables = nil
        super.tearDown()
    }
    
    func testInitialCityIsDefault() {
        XCTAssertEqual(weatherViewModel.city, Constants.Strings.city)
    }
    
    func testGetLocationWithValidCity() {
        let expectation = XCTestExpectation(description: "New York")
        
        weatherViewModel.city = "New Jersey"
        weatherViewModel.$weather
            .dropFirst()
            .sink { weather in
                XCTAssertNotNil(weather)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testWeatherIconReturnsDefault() {
        XCTAssertEqual(weatherViewModel.weatherIcon, "sun")
    }
    
    func testTemperatureFormatting() {
        let tempString = weatherViewModel.getTempFor(25.0)
        XCTAssertEqual(tempString, "25")
    }
}
