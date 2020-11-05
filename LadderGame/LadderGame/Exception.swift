//
//  Exception.swift
//  LadderGame
//
//  Created by zombietux on 2020/11/05.
//  Copyright © 2020 zombietux. All rights reserved.
//

import Foundation

struct Exception {
    func precondition(numberOfPlayer condition: Int) {
        switch condition {
        case ..<2:
            print("최소 인원은 2명 이상입니다.")
            return
        case 9...:
            print("최대 인원은 8명 이상입니다.")
            return
        default:
            print("사다리게임 가능합니다.")
        }
    }
}
