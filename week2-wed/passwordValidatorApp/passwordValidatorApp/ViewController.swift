//
//  ViewController.swift
//  passwordValidatorApp
//
//  Created by zombietux on 2020/11/11.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var myValidator = PasswordValidator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //추가미션을 위한 선언
        passwordInput.delegate = self
        passwordInput.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("!!!!")
    }
    
    //추가미션을 위한 함수
    @objc func textFieldDidChange(_ textField: UITextField) {
        myValidator.passwordValidator(textField.text ?? "")
        updateUI()
    }

    @IBAction func passwordValidatorButtonTapped(_ sender: Any) {
        myValidator.passwordValidator(passwordInput.text ?? "")
        updateUI()
    }
    
    @IBAction func createVeryStrongPasswordButtonTapped(_ sender: Any) {
        let veryStrongPassword = myValidator.createVeryStrongPassword()
        passwordInput.text = veryStrongPassword
        myValidator.passwordValidator(passwordInput.text ?? "")
        updateUI()
    }
    
    func updateUI() {
        levelView.backgroundColor = myValidator.levelColor
        descriptionLabel.text = myValidator.description
    }
}

