//
//  Game.swift
//  ApplePie
//
//  Created by Guest1 on 22/07/25.
//

import Foundation
struct Game{
    var word: String
    var incorrectMoveRemaining: Int
    var guessedLetters: [Character]
    
    mutating func playerGuessed(letter: Character){
        guessedLetters.append(letter)
        if !word.contains(letter){
            incorrectMoveRemaining -= 1
        }
    }
    
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter){
                guessedWord += "\(letter)"
            }else{
                guessedWord += "_"
            }
        }
        return guessedWord
    }
   
}
