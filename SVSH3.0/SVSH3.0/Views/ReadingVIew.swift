//
//  ReadingVIew.swift
//  SVSH3.0
//
//  Created by Shachar on 10/26/22.
//

import SwiftUI

struct ReadingVIew: View {
    
    @EnvironmentObject var category : Category
    @ObservedObject var assesment: Assesment
   
    
    let gradient = LinearGradient(colors: [Color.pink,Color.white],
                                      startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        
        
        
        NavigationStack {
            ZStack {
                gradient
                    .opacity(assesment.op)
                                    .ignoresSafeArea()
                
                VStack {
                    
                    Spacer()
                    
                    Text(assesment.reading.title)
                        .font(.title)
                        .bold()
                    
                    Spacer()
                        .frame(height: 20)
                    
                    ScrollView {
                        Text (assesment.reading.text)
                            .font(.body)
                            .lineSpacing(4)
                            .frame(width: 350)
                    }
                    
                    Spacer()
                        .frame(height: 30)
                    
                    NavigationLink(destination: QuestionView(assesment: assesment).environmentObject(category)) {
                        
                        HStack {
                            Text("Continue")
                            Label("", systemImage: "arrow.right.circle.fill")
                        }
                    }
                    .font(.title2)
                    .bold()
                    .accentColor(.black)
                        
                }
            }
        }
    }
}

struct ReadingVIew_Previews: PreviewProvider {
    static var previews: some View {
        ReadingVIew(assesment: Assesment.sampleAssesment[0])
    }
}
