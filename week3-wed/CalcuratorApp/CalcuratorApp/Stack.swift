//
//  Stack.swift
//  CalcuratorApp
//
//  Created by zombietux on 2020/11/17.
//

import Foundation
import UIKit

struct Stack {
    var myStack: [Double] = []
    var fixedStack: [Double] = []
    
    private(set) var stackColor: UIColor = .systemGray4
    private(set) var fixedStackColor: UIColor = .systemRed
    private(set) var stackTitleColor: UIColor = .systemGray
    private(set) var fixedStackTitleColor: UIColor = .white
    
    mutating func push(_ element: Double) {
        myStack.append(element)
    }
    
    mutating func pop() -> Double? {
        return myStack.popLast()
    }
    
    mutating func fixedPush(_ element: Double) {
        fixedStack.append(element)
    }
}
