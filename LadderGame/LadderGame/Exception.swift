//
//  Exception.swift
//  LadderGame
//
//  Created by zombietux on 2020/11/05.
//  Copyright © 2020 zombietux. All rights reserved.
//

import Foundation

enum ExceptionType: Error {
    case minimumNumberOfPlayer
    case maximumNumberOfPlayer
}

struct Exception {
    func precondition(numberOfPlayer condition: Int) throws {
        switch condition {
        case ..<2:
            throw ExceptionType.minimumNumberOfPlayer
        case 9...:
            throw ExceptionType.maximumNumberOfPlayer
        default:
            print("사다리게임 가능합니다.")
        }
    }
}
