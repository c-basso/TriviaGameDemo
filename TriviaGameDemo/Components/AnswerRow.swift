//
//  AnswerRow.swift
//  TriviaGameDemo
//
//  Created by Vladimir Ivakhnenko on 23.02.2022.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var manager: TriviaManager

    var answer: Answer
    
    @State private var isSelected = false
    
    var green = Color.green
    var red = Color.red
    
    
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            
            Text(answer.text)
                .bold()
            
            if isSelected {
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? green : red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(manager.answerSelected ? (isSelected ? .accentColor : .gray) : .accentColor)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? (answer.isCorrect ? green : red) : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !manager.answerSelected {
                isSelected = true
                manager.selectAnswer(answer)
            }
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Single", isCorrect: false))
            .environmentObject(TriviaManager())
    }
}
