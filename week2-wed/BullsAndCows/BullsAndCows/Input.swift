//
//  Input.swift
//  BullsAndCows
//
//  Created by zombietux on 2020/11/11.
//

import Foundation

struct Input {
    func input() -> Int {
        print("숫자 3개를 입력해주세요. 1.중복 불가! 2. 3자리수 입력!!")
        return Int(readLine() ?? "") ?? 0
    }
}
