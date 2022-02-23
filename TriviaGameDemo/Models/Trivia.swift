//
//  Trivia.swift
//  TriviaGameDemo
//
//  Created by Vladimir Ivakhnenko on 23.02.2022.
//

import Foundation


struct Trivia : Decodable {
    var results: [Result]
    
    struct Result: Decodable, Identifiable {
        var id: UUID {
            UUID()
        }
        
        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correctAnswer: String
        var incorrectAnswers: [String]
        
        var formattedQuestion: AttributedString {
            do {
                return try AttributedString(markdown: question)
            } catch {
                print("Error formatting question: \(error)")
                return ""
            }
        }
        
        var answers: [Answer] {
            do {
                var result: [Answer] = []
                
                result.append(
                    Answer(
                        text: try AttributedString(markdown: correctAnswer),
                        isCorrect: true
                    )
                )
                
                for incorrectAnswer in incorrectAnswers {
                    result.append(
                        Answer(
                            text: try AttributedString(markdown: incorrectAnswer),
                            isCorrect: false
                        )
                    )
                }
                
                return result.shuffled()
            } catch {
                print("Error formatting answers: \(error)")
                return []
            }
        }
    }
}
