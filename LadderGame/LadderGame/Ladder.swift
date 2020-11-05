//
//  Ladder.swift
//  LadderGame
//
//  Created by zombietux on 2020/11/05.
//  Copyright © 2020 zombietux. All rights reserved.
//

import Foundation

struct Ladder {
    private let height: Int
    private let numberOfPlayer: Int
    
    //사용자가 만든 (사다리 높이, 인원 수) tuple정보를 받은 Ladder 구조체 초기화
    init(height: Int, numberOfPlayer: Int) {
        self.height = height
        self.numberOfPlayer = numberOfPlayer
    }
    
    //초기화된 Ladder 구조체가 사다리 뼈대를 만든 후 리턴
    func makeLadder() -> [[Bool]] {
        var ladder = [[Bool]](repeating: Array(repeating: false ,count: self.numberOfPlayer - 1), count: self.height)
        
        for i in 0..<self.height {
            for j in 0..<numberOfPlayer - 1 {
                ladder[i][j] = arc4random_uniform(2) == 0 ? true : false
            }
        }
        return ladder
    }
}
