//
//  QuestionView.swift
//  SVSH3.0
//
//  Created by Shachar on 10/25/22.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var category: Category
    @ObservedObject var assesment: Assesment
 
    
    
    let gradient = LinearGradient(colors: [Color.pink,Color.white],
                                      startPoint: .top, endPoint: .bottom)
   
    var body: some View {
        
        let currentQuestion = assesment.currentQuestion
        
        NavigationStack {
            
            
            if !assesment.finishedSuccesfuly && assesment.time == 0{
                ZStack {
                    
                    gradient
                        .opacity(assesment.op)
                                        .ignoresSafeArea()
                    VStack {
                        Text(assesment.questions[currentQuestion].title)
                            .foregroundColor(.black)
                            .font(.title)
                            .bold()
                            .frame(width: 350)
                            .multilineTextAlignment(.center)
                        Spacer()
                            .frame(height: 50)
                        
                        ForEach (assesment.questions[currentQuestion].choices.indices) { i in
                            
                            ChoiceView(question: assesment.questions[currentQuestion], choice: assesment.questions[currentQuestion].choices[i])
                            
                            Spacer()
                                .frame(height: 30)
                            
                        }
                        
                        Spacer()
                            .frame(height: 50)
                        
                        Button(action: {
                            
                            if assesment.questions[currentQuestion].choiceSelected() {
                                
                                
                                let choosen: Choice = assesment.questions[currentQuestion].selectedChoice()
                                
                                if currentQuestion == 0 {
                                    assesment.score = 0
                                }
                                
                                if choosen.correct {
                                    assesment.score += 1
                                }
                                
                                
                                //Increment the current question
                                assesment.currentQuestion += 1
                                
                                //Inc the op
                                assesment.incOp()
                                
                                if assesment.questions.count == assesment.currentQuestion {
                                    

                                    
                                    if (!assesment.perfectScore()) {
                                        
                                        assesment.currentQuestion = 0
                                        assesment.updateTimeStamp()
                                        
                                    } else {
                                        
                                        self.assesment.finishedSuccesfuly = true
                                        self.category.incPermision()
                                    }
                                    
                                    category.objectWillChange.send()
                                }
                                
                            }
                            
                        }, label: {
                            Text("Submit")
                                .foregroundColor(.black)
                                .font(.title2)
                                .bold()
                                .frame(minWidth: 300, minHeight: 25)
                        })
                        .buttonStyle(.bordered)
                    }
                }
            } else {
                GradingView(assesment: assesment)
            }
         
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(assesment: Assesment.sampleAssesment[0])
    }
}
