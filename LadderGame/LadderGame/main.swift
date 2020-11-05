//
//  main.swift
//  LadderGame
//
//  Created by zombietux on 2020/11/05.
//  Copyright © 2020 zombietux. All rights reserved.
//

import Foundation

//메인 함수
func start() {
    let userInput = Input()
    let ladderInfo = userInput.inputNumberOfPlayer() // 사다리 높이, 인원수를 입력 받음(사다리 높이는 4로 고정)
    let ladderElement = Ladder(height: ladderInfo.0, numberOfPlayer: ladderInfo.1) //(사다리 높이, 인원수) tuple을 Ladder구조체에 넘겨주고 객체를 얻는다.
    let ladder = ladderElement.makeLadder() // 얻은 객체를 갖고 사다리 객체를 만든다.
    
    let print = PrintLadder()
    print.printLadder(ladder: ladder) // 만들어진 사다리 객체를 출력한다.
}

//사다리게임 시작.
start()
