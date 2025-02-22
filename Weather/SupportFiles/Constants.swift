//
//  Constants.swift
//  Weather
//
//  Created by Sagar Sharma on 31/10/24.
//

import SwiftUI

class Constants {

    class Strings {
        static let city = "New York"
        static let keyAPI = "8735c95c4d826b6e44f087128db3a0fe"
        static let url = "https://api.openweathermap.org/data/2.5"
        static let windSpeed = "Wind speed"
        static let humidity = "Humidity"
        static let rainChances = "Rain chances"
    }

    class Dimensions {
        static let firstSpacing: CGFloat = 5
        static let secondSpacing: CGFloat = 10
        static let defaultPadding: CGFloat = 20
        static let cornerRadius: CGFloat = 20
        static let defaultWidth: CGFloat = 30
        static let defaultHeight: CGFloat = 30
    }

    class Colors {
        static let appUpMainColor = SwiftUI.Color(red: 180 / 255, green: 214 / 255, blue: 238 / 255)
        static let appDownMainColor = SwiftUI.Color(red: 121 / 255, green: 231 / 255, blue: 209 / 255)
        static let lightBlueColor = SwiftUI.Color(red: 87 / 255, green: 209 / 255, blue: 240 / 255)
        static let meduimBlueColor = SwiftUI.Color(red: 59 / 255, green: 164 / 255, blue: 237 / 255)
        static let darkBlueColor = SwiftUI.Color(red: 17 / 255, green: 74 / 255, blue: 170 / 255)
        static let gradient = [lightBlueColor.opacity(0.5), darkBlueColor.opacity(0.5)]
        static let gradientAPP = [appUpMainColor, appDownMainColor]
        static let gradientSerchMenu = [appUpMainColor.opacity(0.5), appDownMainColor.opacity(0.5)]
    }

    class Images {
        static let humidity = "humidity"
        static let wind = "wind"
        static let umbrella = "umbrella"
        static let cold = "cold"
        static let warm = "warm"
        static let magnifyingGlass = "magnifyingglass"
        static let location = "location.fill"
    }
    
    class Font {
        static let smallSize: CGFloat = 16
        static let mediumSize: CGFloat = 30
        static let largeSize: CGFloat = 45
    }
}
