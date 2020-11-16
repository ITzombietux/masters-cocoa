//
//  main.swift
//  Matrix
//
//  Created by zombietux on 2020/11/16.
//

import Foundation

func main() {
    let myMatrix = Matrix(a: 9, b: 8, c: 7, d: 4)
    let otherMatrix = Matrix(a: 2, b: 4, c: 1, d: 9)

    let _ = myMatrix.resultView(result: myMatrix.sum(with: otherMatrix))
    let _ = myMatrix.resultView(result: myMatrix.product(with: otherMatrix))
}

main()
