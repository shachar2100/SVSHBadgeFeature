//
//  Catagory.swift
//  SVSH3.0
//
//  Created by Shachar on 10/25/22.
//

import Foundation


class Category : ObservableObject {
 
    @Published var assesments : [Assesment]
    @Published var succesfullyFinished : Bool
    
    var title : String
    
    init(title: String, assesments: [Assesment], succesfullyFinished: Bool) {
        
          self.assesments = assesments
          self.succesfullyFinished = false
          self.title = title
      }
    
    init(title: String, assesments: [Assesment]) {
        
          self.assesments = assesments
          self.succesfullyFinished = false
          self.title = title
      }
    
    
    func incPermision () -> Void {
        print ("Im here")
        for i in 0..<assesments.count{
            print(i)
            if (!assesments[i].permission) {
    
                assesments[i].permission = true
                return
            }
        }
        
        self.succesfullyFinished = true
        self.objectWillChange.send()
        return
    }
    
    
    
    

}


extension Category {
    
    static let sampleCategory : [Category] =
    [
        Category(title: "Consent", assesments: Assesment.sampleAssesment),
        Category(title: "Rape / Sexual Harasment", assesments: Assesment.sampleAssesment1),
        Category(title: "Drugs and Alchohol", assesments: Assesment.sampleAssesment2),
    ]
}
