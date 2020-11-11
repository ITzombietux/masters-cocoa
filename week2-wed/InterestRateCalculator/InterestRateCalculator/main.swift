//
//  main.swift
//  InterestRateCalculator
//
//  Created by zombietux on 2020/11/10.
//

import Foundation

let interestRateCalculator = InterestRateCalculator()
print(interestRateCalculator.getInterestRate(byDay: 90))
print(interestRateCalculator.calculateAmount(day: 90, amount: 3000000))

func testInterest() {
    for unitDay in 1...365 {
        print(interestRateCalculator.testInterest(unitDay: unitDay))
    }
}

testInterest()

