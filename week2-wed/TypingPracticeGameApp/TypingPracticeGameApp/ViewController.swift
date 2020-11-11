//
//  ViewController.swift
//  TypingPracticeGameApp
//
//  Created by zombietux on 2020/11/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentWordLabel: UILabel!
    @IBOutlet weak var nextWordLabel: UILabel!
    @IBOutlet weak var wordInput: UITextField!
    
    var myTypingPracticeGame = TypingPraticeGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTypingPracticeGame.loadWord()
        updateUI()
    }

    @IBAction func correctAnswerCheck(_ sender: Any) {
        myTypingPracticeGame.answerCheck(wordInput: wordInput.text ?? "")
        updateUI()
        wordInput.text = nil
    }
    
    func updateUI() {
        currentWordLabel.text = myTypingPracticeGame.currentWord
        currentWordLabel.textColor = myTypingPracticeGame.currentWordColor
        nextWordLabel.text = myTypingPracticeGame.nextWord
    }
    
    //추가미션
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

