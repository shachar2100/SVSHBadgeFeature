//
//  SVSHCourse.swift
//  SVSH3.0
//
//  Created by Shachar on 10/27/22.
//

import Foundation

class SVSHCourse : ObservableObject {
   
    @Published var course: [Category]
    @Published var succesfullyFinished : Bool
    
    internal init(course: [Category]) {
        self.course = course
        self.succesfullyFinished = false
    }
    
    
    func updateSuccesfullyFinished() -> Void {
        
        for i in 0..<course.count {
            if !course[i].succesfullyFinished {
                return
            }
        }
        
        succesfullyFinished = true
    }
    
    
}


