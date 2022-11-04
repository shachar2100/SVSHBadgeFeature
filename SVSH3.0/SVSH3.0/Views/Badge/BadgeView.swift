//
//  BadgeView.swift
//  SVSH3.0
//
//  Created by Shachar on 10/27/22.
//

import SwiftUI
import AVFoundation

var player: AVAudioPlayer?


struct BadgeView: View {
    
    @State var work : Bool = false
    
    let gradient = LinearGradient(colors: [Color.pink,Color.pink],
                                  startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack {
            
            
               
            gradient
                .opacity(0.84)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                    .frame(height: 50)
                Text("Shay Cohen")
                    .bold()
                    .font(.largeTitle)
                Spacer()
                    .frame(height: 20)
                    
                Text("Are You Ready to Party?")
                    .bold()
                    .font(.largeTitle)
                    .font(.system(size: 100))
               
                    
                
                if work {
                    GifImage("dance-dancing")
                        .scaledToFit()
                        .clipped()
                        .frame(width: 480 ,height: 470, alignment: .topTrailing)
                }
               
                Spacer()
               
                Button ("Press Here" , action: {
                    self.playSound()
                    work = false
                    work = true
                })
                .foregroundColor(.black)
                .font(.title2)
                .bold()
                .frame(minWidth: 300, minHeight: 25)
                .buttonStyle(.bordered)
                
                Spacer()
                    .frame(height: 20)
        
            }
        }
        
       
        
    }
   
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "song", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
   
    
}



}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView()
    }
}
