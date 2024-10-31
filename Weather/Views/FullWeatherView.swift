//
//  FullWeatherView.swift
//  Weather
//
//  Created by Sagar Sharma on 31/10/24.
//

import SwiftUI

struct FullWeatherView: View {
    @StateObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            CurrentlyWeatherView(weatherViewModel: weatherViewModel)
                .padding()
        }
    }
}

struct FullWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        FullWeatherView(weatherViewModel: WeatherViewModel())
    }
}
