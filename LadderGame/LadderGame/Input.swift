//
//  Input.swift
//  LadderGame
//
//  Created by zombietux on 2020/11/05.
//  Copyriht © 2020 zombietux. All rights reserved.
//

import Foundation

typealias height = Int
typealias numberOfPlayer = Int

struct Input {
    let exception = Exception()
    
    func inputNumberOfPlayer() -> (height, numberOfPlayer) {
        print("참여할 인원수를 적어주세요. (2~8명)")
        let numberOfPlayer = Int(readLine() ?? "") ?? 0 // 사용자 수 입력 받기.
        exception.precondition(numberOfPlayer: numberOfPlayer) // 입력받은 사용자 수 예외처리!
        return makeLadderInfo(numberOfPlayer) //예외처리가 문제없으면 makeLadderInfo를 통해 넘겨 줄 (사다리 높이, 인원 수)tuple값 생성
    }
    
    private func makeLadderInfo(_ numberOfPlayer: Int) -> (height, numberOfPlayer) {
        var ladderGameInfo = (4, 0)
        ladderGameInfo.1 = numberOfPlayer

        return ladderGameInfo
    }
}
