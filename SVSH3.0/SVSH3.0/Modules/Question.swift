//
//  Question.swift
//  SVSH3.0
//
//  Created by Shachar on 10/25/22.
//

import Foundation

class Question : ObservableObject {
    
    @Published var choices : [Choice]
    var title : String
    var completed : Bool
    
    init (choices: [Choice], title: String) {
        self.choices = choices
        self.title = title
        self.completed = false
    }
    
    
    func allEnabledF () -> Void {
        for i in 0..<choices.count {
            choices[i].isEnabled = false
        }
    }
    
    
    func choiceSelected() -> Bool {
       
        for i in 0..<choices.count {
            if (choices[i].isEnabled) {
                return true
            }
        }
        return false
    }
    
    func selectedChoice() -> Choice {
        
        for i in 0..<choices.count {
            
            if choices[i].isEnabled {
                
                return choices[i]
            }
        }
        
        return choices[0] //Need to either throw an error or do something else here although it can never go here
    }
}

extension Question {
    static let sampleQuestion : [Question] = [
        
        Question(choices: Choice.sampleChoice[0], title: "Consent is…"),
        
        Question(choices: Choice.sampleChoice[1], title: "A partner pressuring the other when one is not ready is …"),
        
        Question(choices: Choice.sampleChoice[2], title: "If you have had sex before with your partner and they are now passed-out drunk, you…"),
        
        Question(choices: Choice.sampleChoice[3], title: "There is only one form of sexual assault, T or F."),
        
        Question(choices: Choice.sampleChoice[4], title: "Should you have a sexual relation with your boss?")
    ]
}
