//
//  InterestRateCalculator.swift
//  InterestRateCalculator
//
//  Created by zombietux on 2020/11/10.
//

import Foundation

struct InterestRateCalculator {
    func getInterestRate(byDay: Int) -> Double {
        switch byDay {
        case ...90:
            return 0.005
        case 91...180:
            return 0.01
        case 181...364:
            return 0.02
        default:
            return 0.056
        }
    }
    
    func calculateAmount(day: Int, amount: Int) -> Double {
        let interest = Double(amount) * (Double(day) / Double(365)) * getInterestRate(byDay: day)
        return Double(amount) + interest
    }
    
    func testInterest(unitDay: Int) -> Double {
        return calculateAmount(day: unitDay, amount: 1000000)
    }
}
