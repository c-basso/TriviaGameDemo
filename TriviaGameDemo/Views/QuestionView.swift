//
//  QuestionView.swift
//  TriviaGameDemo
//
//  Created by Vladimir Ivakhnenko on 22.02.2022.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var manager: TriviaManager
    
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Trivia Game").lilacTitle()
                Spacer()
                Text("\(manager.index + 1) out of \(manager.length)")
                    .foregroundColor(Color.accentColor)
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: manager.progress)

            VStack(alignment: .leading, spacing: 20) {
                Text(manager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                
                ForEach(manager.answerChoises, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(manager)
                }
            }
            
            Button {
                manager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: manager.answerSelected ? .accentColor : .gray)
            }
            .disabled(!manager.answerSelected)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow)
        .navigationBarHidden(true)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TriviaManager())
    }
}
