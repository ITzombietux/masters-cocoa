//
//  DuplicatedWord.swift
//  week2-mon
//
//  Created by zombietux on 2020/11/09.
//

import Foundation

//연습문제6. 사전(Dictionary) 활용하기
struct DuplicatedWord {
    func duplicatedWords(inputWords: [String]) -> [String] {
        let dups = Dictionary(grouping: inputWords, by: {$0}).filter { $1.count > 1 }.keys
        
        return [String](dups)
    }
}
