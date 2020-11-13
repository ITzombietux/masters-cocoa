//
//  BullsAndCows.swift
//  BullsAndCows
//
//  Created by zombietux on 2020/11/10.
//

import Foundation

struct BullsAndCows {
    private var randomNumbers: Set<String> = []
    private var answer = 0
    private var gameScore = 0
    
    var userNumber = Input()
    
    mutating func newGame() {
        while randomNumbers.count < 3 {
            randomNumbers.insert(String(Int.random(in: 1...9)))
        }
        
        answer = Int(randomNumbers.reduce("", { $0 + $1 })) ?? 0
        bullsAndCows()
    }
    
    private mutating func bullsAndCows() {
        guard showGameScore() == false else {
            print("시도가 9번이 넘어 게임에서 졌습니다.")
            return
        }
        
        // (1,2) => strikeAndBallCount
        let strikeAndBallCount = hit(num: userNumber.input())
        
        guard strikeAndBallCount != (3,0) else {
            print("\(gameScore)째판 만에 게임에서 승리하였습니다!!, 스트라이크 : \(strikeAndBallCount.strikeCount), 볼: \(strikeAndBallCount.ballCount) ")
            return
        }
        
        print("숫자 3개를 다시 입력 해주세요. 스트라이크 : \(strikeAndBallCount.strikeCount), 볼: \(strikeAndBallCount.ballCount) / \(gameScore)째판")
        bullsAndCows()
    }
    
    private mutating func hit(num: Int) -> (strikeCount: Int, ballCount: Int) {
        var hitResult = (0,0)
        let answerNumbers = getComparableNumbers(num: answer)
        let userInputNumbers = getComparableNumbers(num: num)
        
        
        for index in 0...2 {
            if answerNumbers[index] == userInputNumbers[index] {
                hitResult.0 = hitResult.0 + 1
            } else if answerNumbers.contains(userInputNumbers[index]) {
                hitResult.1 = hitResult.1 + 1
            }
        }

        return hitResult //(1, 2)
    }
    
    private mutating func showGameScore() -> Bool {
        gameScore += 1
        
        return gameScore > 10
    }
    
    private func getComparableNumbers(num: Int) -> [Int] {
        var comparableNumbers: [Int] = []
        let hundreds = num / 100
        let tens = (num - hundreds * 100) / 10
        let units = num % 10
        
        comparableNumbers.append(hundreds)
        comparableNumbers.append(tens)
        comparableNumbers.append(units)
        
        return comparableNumbers // [1,2,3]
    }
}
