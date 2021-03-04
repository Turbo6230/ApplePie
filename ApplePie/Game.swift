//
//  Game.swift
//  ApplePie
//
//  Created by Angielina Rutledge on 12/3/20.
//

import Foundation

struct Game {
    var word: String
    var incorrectGuessesRemaining: Int
    var gussesdLetters: [Character]
    
    var formattedWord:  String {
        var gussedWord = ""
        for letter in word {
            if gussesdLetters.contains(letter) {
                gussedWord += "\(letter)"
            } else {
                gussedWord += "_"
            }
        }
        return gussedWord
    }
    
    
    
    mutating func playerGussed(letter: Character) {
        gussesdLetters.append(letter)
        if !word.contains(letter) {
            incorrectGuessesRemaining -= 1
        }
    }
}
