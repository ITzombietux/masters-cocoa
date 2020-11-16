//
//  Bitcount.swift
//  Bitcount
//
//  Created by zombietux on 2020/11/16.
//

import Foundation

extension Bitcount {
    func pow(_ power: Int) -> Int {
        var count: Int = 1
        for _ in 0..<power { count *= 2 }
        return count
    }
}

struct Bitcount {
    private(set) var total: Int
    private var values: [String] = []
    private var count: Int {
        return pow(total)
    }
    
    init(with total: Int) {
        self.total = total
        self.values = getBit()
    }
    
    func find(by bitcount: Int) -> [String] {
        var findResult: [String] = []
        
        for value in values {
            var count = 0
            let splitedValues = value.map { String($0)}
            for splitedValue in splitedValues {
                if splitedValue == "1" {
                    count += 1
                }
            }
            
            if count == bitcount {
                findResult.append(value)
            }
        }

        return findResult
    }
    
    private mutating func getBit() -> [String] {
        var bitValues: [String] = []
        
        for index in 0..<self.count {
            bitValues.append(String(index, radix: 2))
        }
        
        return bitValues
    }
}
