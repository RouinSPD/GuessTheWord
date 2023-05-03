//
//  Game.swift
//  ApplePie
//
//  Created by ios dev lab fi unam on 31/01/23.
//

import Foundation


struct Game{
    var word: String
    var incorrectMovesRemaining : Int
    var guessedLetters: [Character]
    var formattedWord: String{
        var guessedWord = ""
        for letter in word{
            if guessedLetters.contains(letter){
                guessedWord += "\(letter)"
            }else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
    //method that keeps count of the incorrect moves remaining
    mutating func playerGuessed(letter: Character){
        guessedLetters.append(letter)
        if !word.contains(letter){
            incorrectMovesRemaining -= 1
        }
    }
}
