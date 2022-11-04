//
//  SVSH3_0App.swift
//  SVSH3.0
//
//  Created by Shachar on 10/25/22.
//

import SwiftUI

@main
struct SVSH3_0App: App {
    
    //@StateObject var category: Category = Category.sampleCategory[0]
    @StateObject var svshCourse : SVSHCourse = SVSHCourse(course: Category.sampleCategory)
    var body: some Scene {
        WindowGroup {
            
            SVSHView(svshCourse: svshCourse)
        }
    }
}
