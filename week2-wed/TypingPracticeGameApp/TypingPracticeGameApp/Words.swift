//
//  Words.swift
//  TypingPracticeGameApp
//
//  Created by zombietux on 2020/11/11.
//

import Foundation

struct Words {
    private let words = ["피아노", "드럼", "통기타", "베이스기타", "건반", "일렉기타", "보면대", "악보", "무선마이크", "유선마이크"]
    private(set) var endGame: String = "끝났습니다👏👏👏"
    
    func getWords() -> [String] {
        return words.shuffled()
    }
}
