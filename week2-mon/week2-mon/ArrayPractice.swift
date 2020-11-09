//
//  ArrayPractice.swift
//  week2-mon
//
//  Created by zombietux on 2020/11/09.
//

import Foundation

struct ArrayPractice {
    
    private let lines: Int
    private let type: String
    
    init(lines: Int, type: String) {
        self.lines = lines
        self.type = type
    }
        
    func fillArray() -> [[Bool]] {
        let rows: [Bool] = makeRow(lines: lines)
        let columns: [[Bool]] = makeColumn(rows: rows)
        
        return columns
    }

    private func makeRow(lines: Int) -> [Bool] {
        var rows: [Bool] = []

        for _ in 1...lines {
            rows.append(false)
        }

        return rows
    }

    private func makeColumn(rows: [Bool]) -> [[Bool]] {
        var columns: [[Bool]] = []

        for _ in 1...rows.count {
            columns.append(rows)
        }

        return columns
    }
    
    func setBoolArray(_ target: [[Bool]]) -> [[Bool]] {
        switch type {
        case "Left":
            var body: [[Bool]] = target
            
            for row in 0..<lines {
                for column in 0...row {
                    body[row][column] = true
                }
            }

            return body
        case "Right":
            var body: [[Bool]] = target
            
            for row in 0..<lines {
                for column in stride(from: lines-1, through: lines-row-1, by: -1) {
                    body[row][column] = true
                }
            }
            
            return body
        default:
            print("x")
        }
        
        return [[Bool]]()
    }
    
    func printArray(_ target: [[Bool]], newChar: Character) {
        
        switch type {
        case "Left":
            var num = 1
            
            func transferBooltoItem(existInt: Bool) -> String {
                return existInt ? String(num) : " "
            }

            for row in target {
                for column in row {
                    let char = transferBooltoItem(existInt: column)
                    num += 1
                    print("\(char)", terminator: "")
                }
                
                print(" ")
            }

        case "Right":
            func transferBooltoItem(existChar: Bool) -> Character {
                return existChar ? newChar : " "
            }

            for row in target {
                for column in row {
                    let char = transferBooltoItem(existChar: column)
                    print("\(char)", terminator: "")
                }
                print(" ")
            }
        default:
            print("x")
        }
    }
}
