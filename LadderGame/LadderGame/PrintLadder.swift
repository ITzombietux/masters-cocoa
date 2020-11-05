//
//  PrintLadder.swift
//  LadderGame
//
//  Created by zombietux on 2020/11/05.
//  Copyright © 2020 zombietux. All rights reserved.
//

import Foundation

struct PrintLadder {
    //넘겨 받은 사다리 뼈대 출력
    func printLadder(ladder: [[Bool]]) {
        
        //넘겨 받은 사다리 뼈대를 토대로 발판을 만들 것인지 만들지 않을 것인지
        func transferBooltoLadder(existLadder: Bool) -> String {
            return existLadder ? "-" : " "
        }
        
        
        //사다리 출력
        for ladderElements in ladder {
            for ladderElement in ladderElements {
                let ladder = transferBooltoLadder(existLadder: ladderElement)
                print("|\(ladder)", terminator: "")
            }
            print("|")
        }
    }
}
