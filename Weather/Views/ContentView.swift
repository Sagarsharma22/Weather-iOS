//
//  ContentView.swift
//  Weather
//
//  Created by Sagar Sharma on 31/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                SearchCityView(weatherViewModel: weatherViewModel)
                ScrollView(showsIndicators: false) {
                    FullWeatherView(weatherViewModel: weatherViewModel)
                        .padding(.top, Constants.Dimensions.defaultPadding)
                }
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: Constants.Colors.gradientAPP),
                    startPoint: .topLeading, endPoint: .bottomTrailing))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
