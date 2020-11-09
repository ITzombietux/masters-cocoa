//
//  main.swift
//  week2-mon
//
//  Created by zombietux on 2020/11/09.
//

import Foundation

func arrayPrictive() {
    let myArray = ArrayPractice(lines: 5, type: "Right")
    let filledMyArray = myArray.fillArray()
    let setMyArray = myArray.setBoolArray(filledMyArray)
    myArray.printArray(setMyArray, newChar: "$")
}

//arrayPrictive()

func startMagicSquare() {
    let magicSquare = MagicSquare()
    let magicsquareInfo = magicSquare.makeMagicSquare(size: 5)
    magicSquare.printMagicSquare(magicsquareInfo)
}
startMagicSquare()

func signUpValidate() {
    let signUpValidator = SignUpValidator()
    
    print(signUpValidator.iDValidator("asdfzxcvqwer111"))
//    print(signUpValidator.passwordValidator("asdfzxc111f&"))
//    print(signUpValidator.residentRegistrationNumberValidator())
}

signUpValidate()

func startAntPuzzle() {
    let antPuzzle = AntPuzzle()
    print(antPuzzle.antFunction(inputArray: [1,1,1]))
}

//startAntPuzzle()

func findDuplicatedWord() {
    let duplicatedWord = DuplicatedWord()
    print(duplicatedWord.duplicatedWords(inputWords: ["가을", "너굴", "우주", "겨울", "봄봄", "너굴"]))
}

//findDuplicatedWord()
