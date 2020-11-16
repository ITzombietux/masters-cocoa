//
//  BubbleSort.swift
//  BubbleSort
//
//  Created by zombietux on 2020/11/16.
//

import Foundation

class BubbleSort {
    private(set) var bubbleSortTarget: [Int]
    
    init(_ bubbleSortTarget: [Int]) {
        self.bubbleSortTarget = bubbleSortTarget
    }
    
    func sorted(isAscending: Bool) -> [Int] {
        var bubbleSortedTarget = self.bubbleSortTarget
        let length = self.bubbleSortTarget.count
        var temp = 0

        func swap(_ aIndex: Int, _ bIndex: Int) {
            temp = bubbleSortedTarget[bIndex]
            bubbleSortedTarget[bIndex] = bubbleSortedTarget[aIndex]
            bubbleSortedTarget[aIndex] = temp
        }
                
        for _ in 0..<length {
            for innerIteration in 0..<length-1 {
                guard isAscending else {
                    if (bubbleSortedTarget[innerIteration] < bubbleSortedTarget[innerIteration + 1]) {
                        swap(innerIteration, innerIteration + 1)
                    }
                    continue
                }
                
                if (bubbleSortedTarget[innerIteration] > bubbleSortedTarget[innerIteration + 1]) {
                    swap(innerIteration, innerIteration + 1)
                }
            }
        }
        
        return bubbleSortedTarget
    }
}
