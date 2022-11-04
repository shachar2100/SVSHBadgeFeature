//
//  Assesment.swift
//  SVSH3.0
//
//  Created by Shachar on 10/25/22.
//

import Foundation

class Assesment: ObservableObject {

    
    @Published var currentQuestion : Int
    @Published var score : Int
    @Published var permission : Bool
    @Published var finished : Bool
    @Published var finishedSuccesfuly : Bool
    @Published var op : Double
    @Published var timeStamp : Timer.TimerPublisher
    @Published var time : Int
        
    
    var minutesWaiting: Int
    var reading : Reading
    var questions : [Question]
    var addOp : Double
    var shachar : String
    
    
    init(reading: Reading, questions: [Question], permission: Bool) {
        
        self.currentQuestion = 0
        self.score = 0
        self.permission = permission
        self.finished = false
        self.finishedSuccesfuly = false
        self.op = Double (1) / Double (questions.count)
        self.timeStamp = Timer.publish(every: 1, on: .main, in: .common)
        self.time = 0
        self.reading = reading
        self.minutesWaiting = 10
        self.questions = questions
        self.addOp = Double (1) / Double (questions.count)
        self.shachar = ShacharSayings[Int.random(in: 0..<ShacharSayings.count)]
    }
    
    func incOp() -> Void {
        self.op += addOp
    }
    
    func decOp() -> Void {
        
        self.op -= (Double(1 - addOp) / Double(minutesWaiting))
    }
    
    func perfectScore() -> Bool {
        
        return score == questions.count
    }
    
    
    func updateTimeStamp() -> Void {

        self.time = minutesWaiting
    }
    
    
    
    let ShacharSayings : [String] = [
        "Wow! Your as sharp as a marbel",
        "When it was raining brains, you had an umbrella",
        "You could hide your own Easter eggs",
        "You are remarcable",
        "If you were half as smart as you think you are, you’d be twice as smart as you really are.",
        "I can explain it to you, but I cannot understand it for you",
        "More foam than beer",
        "At this point, you can only impress me.",
        "If your brains were dynamite there wouldn't be enough to blow your hat off."
    ]
    
}

extension Assesment {
    static let sampleAssesment : [Assesment] =
    [
        Assesment(reading: Reading.sampleReadings[0], questions: Question.sampleQuestion, permission: true),
        Assesment(reading: Reading.sampleReadings[1], questions: Question.sampleQuestion, permission: false),
        Assesment(reading: Reading.sampleReadings[2], questions: Question.sampleQuestion, permission: false),

    ]
    static let sampleAssesment1 : [Assesment] =
    [
        Assesment(reading: Reading.sampleReadings[0], questions: Question.sampleQuestion, permission: true),
        Assesment(reading: Reading.sampleReadings[1], questions: Question.sampleQuestion, permission: false),
        Assesment(reading: Reading.sampleReadings[2], questions: Question.sampleQuestion, permission: false),

    ]
    static let sampleAssesment2 : [Assesment] =
    [
        Assesment(reading: Reading.sampleReadings[0], questions: Question.sampleQuestion, permission: true),
        Assesment(reading: Reading.sampleReadings[1], questions: Question.sampleQuestion, permission: false),
        Assesment(reading: Reading.sampleReadings[2], questions: Question.sampleQuestion, permission: false),

    ]
}
