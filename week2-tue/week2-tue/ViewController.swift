//
//  ViewController.swift
//  week2-tue
//
//  Created by zombietux on 2020/11/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func convertButtonTapped(_ sender: Any) {
        let value = Double(textField.text ?? "")
        
        var unitConverter = UnitConverter()
        unitConverter.convert(value: value ?? 0, fromUnit: UnitLength.centimeters, toUnit: UnitLength.yards)
        resultLabel.text = "결과: \(unitConverter.result)"
    }
}

