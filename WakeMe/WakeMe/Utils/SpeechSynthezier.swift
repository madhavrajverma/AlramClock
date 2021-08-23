//
//  SpeechSynthezier.swift
//  WakeMe
//
//  Created by Madhav Raj Verma on 8/22/21.
//

import Foundation
import AVFoundation

func speak(speech:String) {
    
    let utterance = AVSpeechUtterance(string: speech)
    
    //configure the utterance
    utterance.rate = 0.5
    utterance.pitchMultiplier = 0.8
    utterance.postUtteranceDelay = 0.2
    utterance.volume = 0.8
    
//    let voice = AVSpeechSynthesisVoice(language: "en-GB")
    
//    utterance.voice = AVSpeechSynthesisVoice(identifier: "Sara")
    
    let synthesizer = AVSpeechSynthesizer()
    
    synthesizer.speak(utterance)
    
}
