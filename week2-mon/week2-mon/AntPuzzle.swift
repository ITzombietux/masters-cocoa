//
//  AntPuzzle.swift
//  week2-mon
//
//  Created by zombietux on 2020/11/09.
//

import Foundation

struct AntPuzzle {
    func antFunction(inputArray: [Int]) -> [Int] {
        var initValue = inputArray[0]
        var count = 0
        var result: [Int] = []
        
        for element in inputArray {
            guard element == initValue else {
                result.append(initValue)
                result.append(count)
                count = 1
                initValue = element
                continue
            }
            
            count += 1
        }
        
        result.append(initValue)
        result.append(count)
        
        return result
    }
}
