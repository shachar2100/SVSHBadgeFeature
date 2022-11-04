//
//  CategoryView.swift
//  SVSH3.0
//
//  Created by Shachar on 10/27/22.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var svshCourse: SVSHCourse
    @StateObject var category: Category
    
    
    
    var body: some View {
        VStack {
            NavigationLink(destination: AssesmentView().environmentObject(category)){

                HStack {
                    
                    HStack{
                        Text(category.title)
                        Spacer()
                        Label(" ", systemImage: "arrow.right.circle.fill")
                    }
                    .font(.title2)
                    .bold()
                    .foregroundColor(.black)
                    .padding()
                    .frame(width:300)
                    .background(Color.pink
                        .opacity(0.1))
                    .cornerRadius(15)

                    if category.succesfullyFinished {
                        Label("", systemImage: "checkmark")
                            .bold()
                            .foregroundColor(.pink)
                            .onAppear{
                                svshCourse.updateSuccesfullyFinished()
                            }
                                
                    }
                }
               
            }
        }
        
    }
      
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category.sampleCategory[0])
    }
}
