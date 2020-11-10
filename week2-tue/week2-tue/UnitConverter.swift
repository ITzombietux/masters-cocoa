//
//  UnitConverter.swift
//  week2-tue
//
//  Created by zombietux on 2020/11/10.
//

import Foundation

struct UnitConverter {
    private (set) var result: String = ""
 
    mutating func convert(value: Double, fromUnit: Unit, toUnit: Unit) {
        let measurement = Measurement(value: value , unit: UnitLength.centimeters)
        let convertedValue = measurement.converted(to: .yards)
        
        result = "\(convertedValue)"
    }
}
