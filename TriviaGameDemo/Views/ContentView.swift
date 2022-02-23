//
//  ContentView.swift
//  TriviaGameDemo
//
//  Created by Vladimir Ivakhnenko on 22.02.2022.
//

import SwiftUI
 
struct ContentView: View {
    @StateObject var manager = TriviaManager()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("Trivia Game").lilacTitle()
                    
                    Text("Are you ready to test out your trivia skills?")
                        .foregroundColor(Color.accentColor)
                    
                    NavigationLink {
                        TriviaView()
                            .environmentObject(manager)
                    } label: {
                        PrimaryButton(text: "Let's go!")
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color.yellow)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
