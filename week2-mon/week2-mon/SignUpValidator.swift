//
//  SignUpValidation.swift
//  week2-mon
//
//  Created by zombietux on 2020/11/09.
//

import Foundation

enum SetType: String {
    case characterSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    case numberSet = "0123456789"
    case characterAndNumberSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
}

struct SignUpValidator {
    //연습문제2. 아이디 규칙 검사
    func iDValidator(_ id: String) -> Bool {
        let lengthAndElementRegEx = "^\\w{5,23}[a-zA-Z0-9-]$"
        //.......................iD 123/ 111 체크하는 정규식 못찾음..ㅠㅠ
        let continuousRegEx = "^([0-9])\\1{2,}$"

        let lengthAndElementValidate = NSPredicate(format:"SELF MATCHES %@", lengthAndElementRegEx)
        
        guard lengthAndElementValidate.evaluate(with: id) == true else {
            return false
        }
        
        let continuousValidate = NSPredicate(format:"SELF MATCHES %@", continuousRegEx)
        print(continuousValidate)

        guard continuousValidate.evaluate(with: id) == true else {
            print("###false")
            return false
        }

        return true
    }

    //연습문제3. 비밀번호 등급 확인
    func passwordValidator(_ password: String) -> Int {
        let level = passwordElementValidator(password: password)
        
        return level
    }
    
    private func passwordElementValidator(password: String) -> Int {
        let passwordCount = getLength(elements: password, characterAndNumberSet: SetType.characterAndNumberSet.rawValue)
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
            if !SetType.numberSet.rawValue.contains(element) {
                specialCharacters.append(element)
            }
        }
        
        if characters.count == 0 && passwordCount < 8 {
            return 1
        }
        
        if numbers.count == 0 && passwordCount < 8 {
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
    
    //연습문제4. 주민번호 판별검사
    func residentRegistrationNumberValidator(_ residentRegistrationNumber: Int) -> Bool {
        let splitedResidentRegistrationNumber = getElements(elements: String(residentRegistrationNumber))
        let checkNumbers = [2,3,4,5,6,7,8,9,2,3,4,5]
        var n = 0

        for i in 0..<checkNumbers.count {
            n += checkNumbers[i] * splitedResidentRegistrationNumber[i]
        }

        let k = (11 - n % 11) % 10

        if k == splitedResidentRegistrationNumber.last {
            return true
        }

        return false
    }

    private func getLength(elements: String, characterAndNumberSet: String) -> Int {
        var splitedElements: [Character] = []
        
        for element in elements {
            if SetType.characterSet.rawValue.contains(element) {
                splitedElements.append(element)
            }
        }
        
        return splitedElements.count
    }
    
    private func getElements(elements: String) -> [Int] {
        let splitedElements = elements.compactMap{Int(String($0))}
        
        return splitedElements
    }
}
