//
//  TriviaView.swift
//  TriviaGameDemo
//
//  Created by Vladimir Ivakhnenko on 23.02.2022.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var manager: TriviaManager

    var body: some View {
        if manager.reachedEnd {
            VStack(spacing: 20) {
                Text("Trivia Game").lilacTitle()
                
                Text("Congratulations, you completed the game!")
                
                Text("You scored \(manager.score) out of \(manager.length )")
         
            
                Button {
                    Task.init {
                        await manager.fetchTrivia()
                    }
                } label: {
                    PrimaryButton(text: "Play again")
                }
            }
            .foregroundColor(.accentColor)
            .padding()
            .frame(maxWidth:.infinity, maxHeight: .infinity)
            .background(.yellow)
        } else {
            QuestionView().environmentObject(manager)
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView().environmentObject(TriviaManager())
    }
}
