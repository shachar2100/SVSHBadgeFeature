//
//  GradingView.swift
//  SVSH3.0
//
//  Created by Shachar on 10/26/22.
//

import SwiftUI

struct GradingView: View {
    
    @ObservedObject var assesment: Assesment
    
  
    
    
    let gradient = LinearGradient(colors: [Color.pink,Color.white],
                                      startPoint: .top, endPoint: .bottom)
   
  
 
    var body: some View {
        
        let score = Int ((Double(assesment.score) / Double(assesment.questions.count)) * 100)
         
        ZStack {
            
            
            
            gradient
                .opacity(assesment.op)
                                .ignoresSafeArea()
            VStack {
                if !assesment.finishedSuccesfuly {
                
                    Text(assesment.shachar)
                        .foregroundColor(.black)
                        .font(.title)
                        .bold()
                        .frame(width: 350)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    
                    
                    Text("Your Score: %\(score)")
                        .foregroundColor(.black)
                        .font(.title2)
                        .bold()
                        .frame(width: 350)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Text("Try agian in: \(assesment.time) min")
                        .foregroundColor(.black)
                        .font(.title3)
                        .bold()
                        .frame(width: 350)
                        .multilineTextAlignment(.center)
                        
                    Spacer()
                        .frame(height: 50)
                    
                }else {
                    
                    Text("Congrats on Finishing \(assesment.reading.title)")
                        .foregroundColor(.black)
                        .font(.title)
                        .bold()
                        .frame(width: 350)
                        .multilineTextAlignment(.center)
                    
                    Text("Your Score: %\(score)")
                }
            }
         
        }
        
       
    }
    
    
}

struct GradingView_Previews: PreviewProvider {
    static var previews: some View {
        GradingView(assesment: Assesment.sampleAssesment[0])
    }
}
