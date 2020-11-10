//
//  UnitConverter.swift
//  week2-tue
//
//  Created by zombietux on 2020/11/10.
//

import Foundation

struct UnitConverter {
    private (set) var result: [String] = []
 
    mutating func convert(value: Double, fromUnits: [Dimension], toUnit: Dimension) {
        
        for fromUnit in fromUnits {
            let measurement = Measurement(value: value , unit: fromUnit)
            let convertedValue = measurement.converted(to: toUnit)
            
            result.append("\(convertedValue)")
        }
    }
}
