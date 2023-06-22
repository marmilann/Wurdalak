//
//  MusicAudioPlayer.swift
//  Wurdalak
//
//  Created by Nariman on 22.06.2023.
//

import Foundation
import AVFoundation

public class AudioPlayer: NSObject, ObservableObject {
    static let shared = AudioPlayer()
    private var player: AVAudioPlayer?
    
    override private init() {
        super.init()
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set audio session category.")
        }
    }
    
    func playSound(soundName: String, soundExtension: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: soundExtension) else {
            print("Sound file not found.")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1 // Бесконечное повторение
            player?.play()
        } catch {
            print("Failed to play sound.")
        }
    }
    
    func stopSound() {
        player?.stop()
    }
}
