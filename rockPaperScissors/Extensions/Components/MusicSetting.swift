//
//  MusicSetting.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 29/09/2023.
//

import AVFoundation

class MusicSetting {
    
    static let share = MusicSetting()
    
    var audioPlayer: AVAudioPlayer?
    
    func setMusic() {
        if let soundURL = Bundle.main.url(forResource: "lady-of-the-80x27s-128379", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.volume = 1.0
                audioPlayer?.play()
            } catch {
                print("error")
            }
        }
    }
}
