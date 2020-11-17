//
//  Matrix.swift
//  Matrix
//
//  Created by zombietux on 2020/11/16.
//

import Foundation

class Matrix {
    private(set) var a : Double
    private(set) var b : Double
    private(set) var c : Double
    private(set) var d : Double
    
    init(a: Double = 0, b: Double = 0, c:Double = 0, d:Double = 0) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
    }
    
    func sum(with other: Matrix) -> Matrix {
        let result = Matrix()
        
        result.a = self.a + other.a
        result.b = self.b + other.b
        result.c = self.c + other.c
        result.d = self.d + other.d
        
        return result
    }
    
    func product(with other: Matrix) -> Matrix {
        let result = Matrix()
        
        result.a = (self.a * other.a) + (self.b * other.c)
        result.b = (self.a * other.b) + (self.b * other.d)
        result.c = (self.c * other.a) + (self.d * other.c)
        result.d = (self.c * other.b) + (self.d * other.d)
        
        return result
    }
    
    func resultView(result: Matrix) {
        print(result.a, result.b, result.c, result.d)
    }
}
