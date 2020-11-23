//
//  main.swift
//  MatchingParentheses
//
//  Created by zombietux on 2020/11/18.
//

import Foundation

func main() {
//    let myMatchingParentheses = MatchingParentheses(with: .curly)
//    print(myMatchingParentheses.generate(with: 3))
//    myMatchingParentheses.analyze(with: "}{}")
    
    func transfer(_ string: String) -> String {
        return "ㅏ"
    }
    let numberArray = ["l", "l", "l"]
    let resultArray = numberArray.map(transfer)
    print(resultArray)
}

main()

