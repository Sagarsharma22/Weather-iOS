//
//  Localization.swift
//  Weather
//
//  Created by Sagar Sharma on 31/10/24.
//

import SwiftUI

extension String {
    func localizated() -> String {
        return NSLocalizedString(self,
                                 tableName: "Localization",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
}
