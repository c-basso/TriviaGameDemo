//
//  Answer.swift
//  TriviaGameDemo
//
//  Created by Vladimir Ivakhnenko on 23.02.2022.
//

import Foundation

struct Answer : Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
