//
//  Calcurator.swift
//  CalcuratorApp
//
//  Created by zombietux on 2020/11/17.
//

import Foundation

class Calculator {
    var lastOperation = 0
    var currentNumber = 0.0
    private(set) var initResult = ""
    private(set) var isCalcPress = false
    private(set) var fixedStackElementCount = 0
    var stack = Stack()
    
    func calculate(firstNumber: Double, secondNumber: Double, operation: Int) -> Double {
        var total = 0.0
        
        switch operation {
        case 10:
            total = firstNumber + secondNumber
        case 11:
            total = secondNumber - firstNumber
        case 12:
            total = firstNumber * secondNumber
        case 13:
            total = secondNumber / firstNumber
        default:
            print("에러!")
        }
        
        return Double(floor(1000*total)/1000)
    }
     
    func calculateAndReturnOperation() {
        if stack.myStack.count >= 2 {
            currentNumber = calculate(firstNumber: stack.pop() ?? 0.0, secondNumber: stack.pop() ?? 0.0, operation: self.lastOperation)
            stack.push(currentNumber) // 6.0
        }
    }
    
    func calculateAndReturnEqual() {
        stack.fixedPush(stack.pop() ?? 0.0)
        fixedStackElementCount += 1
        lastOperation = 0
    }
    
    func operatorCalculate(operation: Int) { //함수명 리팩토링 필요
        if stack.myStack.count == 0 {
            stack.push(currentNumber)
        }
        lastOperation = operation
    }
    
    func numberCalculate() { //함수명 리팩토링 필요
        if lastOperation != 0 {
            stack.push(currentNumber)
        }
    }
    
    func shakeEvent() {
        stack.fixedStack.removeAll()
        stack.myStack.removeAll()
        fixedStackElementCount = 0
        lastOperation = 0
    }
}
