//
//  PasswordValidator.swift
//  passwordValidatorApp
//
//  Created by zombietux on 2020/11/11.
//

import Foundation
import UIKit

enum SetType: String {
    case characterSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    case numberSet = "0123456789"
    case specialCharacterSet = "-+!@#$%"
    case passwordSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-+!@#$%"
}

struct PasswordValidator {

    private (set) var levelColor: UIColor = .yellow
    private (set) var description: String = "보통 암호"
    
    mutating func passwordValidator(_ password: String) {
        let level = passwordElementValidator(password: password)
        updateUI(level: level)
    }
    
    private mutating func passwordElementValidator(password: String) -> Int {
        let passwordCount = password.count
        var characters = ""
        var numbers = ""
        var specialCharacters = ""
        
        for element in password {
            guard SetType.characterSet.rawValue.contains(element) else {
                numbers.append(element)
                continue
            }
            
            characters.append(element)
        }
        
        for element in numbers {
            if SetType.specialCharacterSet.rawValue.contains(element) {
                specialCharacters.append(element)
            }
        }
        
        if characters.count == 0 && specialCharacters.count == 0 && passwordCount < 8 {
            return 1
        }
        
        if numbers.count == 0 && specialCharacters.count == 0 && passwordCount < 8 {
            return 2
        }

        if characters.count >= 1 && numbers.count >= 1 && specialCharacters.count == 0 && passwordCount >= 8 {
            return 4
        }
        
        if specialCharacters.count > 0 && passwordCount >= 8 {
            return 5
        }

        return 3
    }
    
    private mutating func updateUI(level: Int) {
        switch level {
        case 1:
            levelColor = .red
            description = "아주 약한 암호"
        case 2:
            levelColor = .orange
            description = "약한 암호"
        case 4:
            levelColor = .blue
            description = "강한 암호"
        case 5:
            levelColor = .green
            description = "아주 강한 암호"
        default:
            levelColor = .yellow
            description = "보통 암호"
        }
    }
    
    //MARK:- 아주 강한 암호 랜덤으로 만들기
    func createVeryStrongPassword() -> String {
        var password = ""
        
        let randomString = createRandomElement(length: 8, SetType: .characterSet)
        let randomNumber = createRandomElement(length: 5, SetType: .numberSet)
        let randomSpecialCharacter = createRandomElement(length: 8, SetType: .specialCharacterSet)
        
        password = randomString + randomNumber + randomSpecialCharacter
        let shuffledVeryStrongPassword = String(password.shuffled())
        
        return shuffledVeryStrongPassword
    }
    
    private func createRandomElement(length: Int, SetType: SetType) -> String {
        return String((0..<length).map{ _ in SetType.rawValue.randomElement()!})
    }
}
