//
//  UnitConverter.swift
//  week2-tue
//
//  Created by zombietux on 2020/11/10.
//

import Foundation

struct UnitConverter {
    private (set) var result: String = ""
 
    mutating func convert(value: Double, fromUnit: Dimension, toUnit: Dimension) {
        let measurement = Measurement(value: value , unit: fromUnit)
        let convertedValue = measurement.converted(to: toUnit)
        
        result = "\(convertedValue)"
    }
}
