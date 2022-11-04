//
//  Choice.swift
//  SVSH3.0
//
//  Created by Shachar on 10/25/22.
//

import Foundation

class Choice : ObservableObject {
    
    @Published var isEnabled : Bool
    var text : String = ""
    var correct: Bool
    
    
    init (text: String, correct: Bool) {
        self.isEnabled = false
        self.text = text
        self.correct = correct
    }
    
    init (text: String) {
        self.isEnabled = false
        self.text = text
        self.correct = false
    }
    
}

extension Choice {
    static let sampleChoice : [[Choice]] = [
        
        [Choice(text: "Revocable, Conscious, Enthusiastic, Verbal, and Ongoing.", correct: true), Choice(text: "Given at the beginning of the night."), Choice(text: " Irrevocable, incoherent, and implicit."), Choice(text: "Not necessary if you have been with the person before.")],
        [Choice(text: "Normal"), Choice(text: "Not great, but understandable."), Choice(text: "A form of sexual assault.", correct: true), Choice(text: "A partner’s right to have sex whenever they want.")],
        [Choice(text: "can have sex with them since you have done it before."), Choice(text: "Must give them the necessary space and respect that they are not fit to answer.", correct: true), Choice(text: "Have consent."), Choice(text: "Can ask their friend to see if they give you consent")],
        [Choice(text: "T, any type of an unwanted sexual advance is considered to be rape."), Choice(text: "F, sexual assault cannot happen in a party where everybody knows each other."), Choice(text: "F, there are many types of sexual assault like Forcible sodomy, Rape, and any type of unwanted sexual advance.", correct: true), Choice(text: "F, sexual assualt does not happen anymore.")],
        [Choice(text: "Yes it motivates you to work harder."), Choice(text: "Absolutly!", correct: true), Choice(text: "Some might say it's risky business."), Choice(text: "You might even get a raise if your good.")]        
    ]
}

