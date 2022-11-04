//
//  SVSHView.swift
//  SVSH3.0
//
//  Created by Shachar on 10/27/22.
//

import SwiftUI

struct SVSHView: View {
    
    @StateObject var svshCourse: SVSHCourse
    
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
                    
                    Text("SVSH Badge")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    Spacer()
                        .frame(height: 50)
                    
                    ForEach (svshCourse.course.indices) { i in
                        
                        CategoryView(category: svshCourse.course[i]).environmentObject(svshCourse)
                        Spacer()
                            .frame(height: 30)
                    }
                       
                  
                    Spacer()
                        .frame(height: 30)
                    
                    VStack{
                        if svshCourse.succesfullyFinished {
                            
                            Text("Badge")
                                .font(.title)
                                .bold()
                                .frame(width: 100, height: 20)
                        }
                       
                          
                            
                        HStack {
                          
                            Image("ShayLogo")
                                .resizable()
                                .frame(width:300, height: 100)
                                
                            
                            if svshCourse.succesfullyFinished{
                                NavigationLink(destination: BadgeView()) {
                                    Label(" ", systemImage: "arrow.right.circle.fill")
                                        .bold()
                                        .foregroundColor(.black)
                                        .font(.title2)
                                }
                            }
                            Spacer()
                        }

                    }
                  
                        
        
                        
                    
                    
                    Spacer()
                    
                    
                    HStack{
                        Label("", systemImage: "heart")
                        Text("Made by the Dawn")
                        Label("", systemImage: "heart")
                    }
                    .font(.footnote)
                    .bold()
                    }
                    
                  
                }
            }
        }
}



struct SVSHView_Previews: PreviewProvider {
    static var previews: some View {
        SVSHView(svshCourse: SVSHCourse(course: Category.sampleCategory))
    }
}

