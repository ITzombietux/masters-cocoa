//
//  MagicSquare.swift
//  week2-mon
//
//  Created by zombietux on 2020/11/09.
//

import Foundation

//MARK:- asdfasdf
//FIXME:- asdf
//TODO:-sadf
struct MagicSquare {
    func makeMagicSquare(size: Int) -> [[Int]] {
        var magicSquare = Array(repeating:Array(repeating:0, count: size), count: size)
        
        var row = size - 1
        var col = size / 2
        
        magicSquare[row][col] = 1
        
        for i in 2...size*size {
            if magicSquare[(row + 1) % size][(col + 1) % size] == 0 {
                row = (row + 1) % size
                col = (col + 1) % size
            } else {
                row = (row - 1 + size) % size
            }
            
            magicSquare[row][col] = i
        }
        
        return magicSquare
    }

    func printMagicSquare(_ magicSquare : [[Int]]) {
        for i in 0..<magicSquare.count {
            for j in 0..<magicSquare.count {
                print(magicSquare[i][j] , terminator:" ")
            }
            print(" ")
        }
    }

}
