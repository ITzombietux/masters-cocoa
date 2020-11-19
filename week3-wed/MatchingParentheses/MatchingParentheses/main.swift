//
//  main.swift
//  MatchingParentheses
//
//  Created by zombietux on 2020/11/18.
//

import Foundation

func main() {
    let myMatchingParentheses = MatchingParentheses(with: .curly)
    myMatchingParentheses.generate(with: 3)
    print(myMatchingParentheses.analyze(with: "}{}"))
}

main()

