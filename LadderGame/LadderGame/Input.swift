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
        let numberOfPlayer = Int(readLine() ?? "") ?? 0
        exception.precondition(numberOfPlayer: numberOfPlayer)
        return makeLadderInfo(numberOfPlayer)
    }
    
    private func makeLadderInfo(_ numberOfPlayer: Int) -> (height, numberOfPlayer) {
        var ladderGameInfo = (4, 0)
        ladderGameInfo.1 = numberOfPlayer

        return ladderGameInfo
    }
}
