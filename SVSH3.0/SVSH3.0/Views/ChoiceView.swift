//
//  ChoiceView.swift
//  SVSH3.0
//
//  Created by Shachar on 10/25/22.
//

import SwiftUI

struct ChoiceView: View {
    
    @ObservedObject var question: Question
    @ObservedObject var choice: Choice
    
    var body: some View {
        
        HStack {
            
            if choice.isEnabled {
                Button(action: {
                    question.allEnabledF()
                    choice.isEnabled = true
                }, label: {
                    Text(choice.text)
                        .foregroundColor(.pink)
                        .font(.title3)
                })
                .controlSize(.regular)
                .buttonStyle(.bordered)
            } else {
                Button(action: {
                    question.allEnabledF()
                    choice.isEnabled = true
                }, label: {
                    Text(choice.text)
                        .foregroundColor(.pink)
                        .font(.title3)
                })
                .controlSize(.regular)
                .buttonStyle(.borderless)
            }
        }
        .frame(width: 350)
    }
}

struct ChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceView(question: Question.sampleQuestion[0], choice: Choice.sampleChoice[0][0])
    }
}
