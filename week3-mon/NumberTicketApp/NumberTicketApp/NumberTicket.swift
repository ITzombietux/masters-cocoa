//
//  NumberTicket.swift
//  NumberTicketApp
//
//  Created by zombietux on 2020/11/16.
//

import Foundation

struct Percent {
    private(set) var ratio: Float
}

struct NumberTicket {
    private(set) var waitingNumber = 0
    private(set) var enableWaiting = true
    private(set) var enableComplete = true
    var waitingPercent: Percent {
        let ratio = Float(waitingNumber) / Float(20)
        return Percent(ratio: ratio)
    }
    
    mutating func waitingNumberUp() {
        if waitingNumber < 20 {
            waitingNumber += 1
            enableComplete = true
        } else {
            enableWaiting = false
        }
    }
    
    mutating func waitingNumberDown() {
        if waitingNumber > 0 {
            waitingNumber -= 1
            enableWaiting = true
        } else {
            enableComplete = false
        }
    }
}
