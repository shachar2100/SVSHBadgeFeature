//
//  AssesmentView.swift
//  SVSH3.0
//
//  Created by Shachar on 10/26/22.
//

import SwiftUI

struct AssesmentView: View {
    
    @EnvironmentObject var category: Category
    //@State var assementComplete : [Bool]
    
    let gradient = LinearGradient(colors: [Color.pink,Color.white],
                                      startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        NavigationStack {
            ZStack {
                gradient
                    .opacity(0.5)
                        .ignoresSafeArea()
                
                VStack {
                    Spacer()
                        .frame(height: 80)
                    
                    
                    Text(category.title)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    Spacer()
                        .frame(height: 50)
                    
                    ForEach (category.assesments.indices) { i in
                        NavigationLink(destination: ReadingVIew(assesment: category.assesments[i]).environmentObject(category)) {
                            HStack{
                                Text(category.assesments[i].reading.title)
                                Spacer()
                                Label(" ", systemImage: category.assesments[i].permission ? "arrow.right.circle.fill" : "circle")
                            }
                            .font(.title2)
                            .bold()
                            .foregroundColor(.black)
                            .padding()
                            .frame(width:300)
                            .background(Color.pink
                                .opacity(category.assesments[i].permission ? 0.2 : 0.05))
                                .cornerRadius(15)
                            
                            if   category.assesments[i].finishedSuccesfuly {
                                 Label("", systemImage: "checkmark")
                                     .bold()
                                     .foregroundColor(.pink)
                             }
                            
                        }
                        .disabled(!category.assesments[i].permission)
                        .onReceive(category.assesments[i].timeStamp.autoconnect()) { time in
                            if category.assesments[i].time > 0 {
                                category.assesments[i].time -= 1
                                category.assesments[i].decOp()
                            }
                        }
                      
                        
                        Spacer()
                            .frame(height: 50)
                    }
                    
                    Spacer()
                        .frame(height: 70)
                }
            }
            
           
        }
        .onAppear(perform: {
          print("hello")
        })
        
        
        
    }
   
}


struct AssesmentView_Previews: PreviewProvider {
    static var previews: some View {
        AssesmentView()
    }
}
