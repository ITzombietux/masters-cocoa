//
//  TypingPracticeGame.swift
//  TypingPracticeGameApp
//
//  Created by zombietux on 2020/11/11.
//

import Foundation
import UIKit

struct TypingPraticeGame {
    private (set) var currentWord = ""
    private (set) var nextWord = ""
    private (set) var gamesStep = 0
    private (set) var isAnswer = false
    private var words: [String] = []
    private (set) var currentWordColor: UIColor = .black
    
    let myWords = Words()
    
    mutating func loadWord() {
        words = myWords.getWords()
        currentWord = words[gamesStep]
        nextWord = words[gamesStep + 1]
    }
    
    mutating func  setWord() {
        if currentWord == words[8] {
            currentWord = words[gamesStep]
            nextWord = ""
        } else if currentWord == words[9] {
            currentWord = myWords.endGame
        } else {
            currentWord = words[gamesStep]
            nextWord = words[gamesStep + 1]
        }
    }
    
    mutating func moveWord() {
        gamesStep += 1
    }
    
    mutating func answerCheck(wordInput: String) {
        if currentWord == wordInput {
            isAnswer = true
            moveWord()
            setWord()
            currentWordColor = .black //추가미션
        } else {
            isAnswer = false
            currentWordColor = .red //추가미션
        }
    }
}
