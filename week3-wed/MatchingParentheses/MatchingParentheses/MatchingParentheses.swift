//
//  MatchingParentheses.swift
//  MatchingParentheses
//
//  Created by zombietux on 2020/11/18.
//

import Foundation

struct MatchingParentheses {
    enum Bracket {
        case round
        case square
        case curly
    }
    
    private let open: Character
    private let close: Character
    
    init(with: Bracket) {
        switch with {
        case .round:
            self.open = "("
            self.close = ")"
        case .curly:
            self.open = "{"
            self.close = "}"
        case .square:
            self.open = "["
            self.close = "]"
        }
    }
    
    func generate(with count: Int) -> [String] {
        var correctBracketArray = [String]()
        let outOfOrderBracket = String(repeating: open, count: count) + String(repeating: close, count: count)
        let outOfOrderBracketArray: [String] = outOfOrderBracket.map { String($0) }
        
        func permute(list: [String], minStringLen: Int) -> Set<String> {
            func permute(fromList: [String], toList: [String], minStringLen: Int, set: inout Set<String>) {
                if toList.count >= minStringLen {
                    set.insert(toList.joined(separator: ""))
                }
                
                if !fromList.isEmpty {
                    for (index, item) in fromList.enumerated() {
                        var newFrom = fromList
                        newFrom.remove(at: index)
                        permute(fromList: newFrom, toList: toList + [item], minStringLen: minStringLen, set: &set)
                    }
                }
            }

            var bracketSet = Set<String>()
            permute(fromList: list, toList:[], minStringLen: minStringLen, set: &bracketSet)
            
            return bracketSet
        }
        
        let permutedBracketArray = permute(list: outOfOrderBracketArray, minStringLen: outOfOrderBracket.count)
        
        for permutedBracketString in permutedBracketArray {
            if analyze(with: permutedBracketString) {
                correctBracketArray.append(permutedBracketString)
            }
        }
        
        return correctBracketArray
    }
    
    func analyze(with value: String) -> Bool {
        let pairs: [Character: Character] = [self.open : self.close]
        var stack: [Character] = []
        
        for char in value {
            if let match = pairs[char] {
                stack.append(match)
            } else if stack.last == char {
                stack.popLast()
            } else {
                return false
            }
        }
        return stack.isEmpty
    }
}
