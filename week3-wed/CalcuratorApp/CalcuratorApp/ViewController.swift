//
//  ViewController.swift
//  CalcuratorApp
//
//  Created by zombietux on 2020/11/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var stack1: UIButton!
    @IBOutlet weak var stack2: UIButton!
    @IBOutlet weak var stack3: UIButton!
    @IBOutlet weak var stack4: UIButton!
    @IBOutlet weak var stack5: UIButton!
    
    var calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonClick(_ sender: UIButton) {
        displayLabel.text! += sender.currentTitle ?? ""
        calculator.currentNumber = Double(displayLabel.text ?? "") ?? 0.0
        calculator.numberCalculate()
        calculator.calculateAndReturnOperation()
        
        if calculator.fixedStackElementCount != 0 {
            stackUpdate(element: calculator.stack.fixedStack[calculator.fixedStackElementCount - 1], address: calculator.stack.fixedStack.count, fixedStackCount: calculator.fixedStackElementCount)
        } else {
            stackUpdate(element: calculator.currentNumber, address: calculator.stack.myStack.count, fixedStackCount: calculator.fixedStackElementCount)
        }
    }
    
    @IBAction func operatorClick(_ sender: UIButton) {
        calculator.operatorCalculate(operation: sender.tag)
        displayLabel.text! = ""
        displayLabel.text = calculator.initResult

        if calculator.fixedStackElementCount != 0 {
            stackUpdate(element: calculator.currentNumber, address: calculator.stack.fixedStack.count + 1, fixedStackCount: calculator.fixedStackElementCount)
        } else {
            stackUpdate(element: calculator.currentNumber, address: calculator.stack.myStack.count, fixedStackCount: calculator.fixedStackElementCount)
        }
    }
    
    @IBAction func equalsClick(_ sender: UIButton) {
        calculator.calculateAndReturnEqual()
        displayLabel.text = calculator.initResult
        
        stackUpdate(element: calculator.currentNumber, address: calculator.stack.fixedStack.count, fixedStackCount: calculator.fixedStackElementCount)
    }
    
    private func stackUpdate(element: Double, address: Int, fixedStackCount: Int) {
        switch address {
        case 1:
            stack1.setTitle("\(element)", for: .normal)
        case 2:
            stack2.setTitle("\(element)", for: .normal)
        case 3:
            stack3.setTitle("\(element)", for: .normal)
        case 4:
            stack4.setTitle("\(element)", for: .normal)
        case 5:
            stack5.setTitle("\(element)", for: .normal)
        default:
            break
        }
        
        if fixedStackCount > 0 {
            fixedStackUpdateUI(fixedStackCount: fixedStackCount)
        }
    }
    
    func fixedStackUpdateUI(fixedStackCount: Int) {
        switch fixedStackCount {
        case 1:
            stack1.backgroundColor = calculator.stack.fixedStackColor
            stack1.setTitleColor(calculator.stack.fixedStackTitleColor, for: .normal)
        case 2:
            stack2.backgroundColor = calculator.stack.fixedStackColor
            stack2.setTitleColor(calculator.stack.fixedStackTitleColor, for: .normal)
        case 3:
            stack3.backgroundColor = calculator.stack.fixedStackColor
            stack3.setTitleColor(calculator.stack.fixedStackTitleColor, for: .normal)
        case 4:
            stack4.backgroundColor = calculator.stack.fixedStackColor
            stack4.setTitleColor(calculator.stack.fixedStackTitleColor, for: .normal)
        case 5:
            stack5.backgroundColor = calculator.stack.fixedStackColor
            stack5.setTitleColor(calculator.stack.fixedStackTitleColor, for: .normal)
        default:
            break
        }
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            calculator.shakeEvent()
        }
    }
}
