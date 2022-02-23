//
//  Extensions.swift
//  TriviaGameDemo
//
//  Created by Vladimir Ivakhnenko on 22.02.2022.
//

import Foundation
import SwiftUI

extension Text {
    func lilacTitle() -> some View {
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color.accentColor)
    }
}
