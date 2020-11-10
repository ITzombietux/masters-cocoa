//
//  ViewController.swift
//  week2-tue
//
//  Created by zombietux on 2020/11/10.
//

/*
 let street1 = Measurement(value: 73, unit: UnitLength.meters)
 let street2 = Measurement(value: 67, unit: UnitLength.meters)
 var commuteDistance = street1 + street2
 commuteDistance.convert(to: UnitLength.yards)
 
 단위 목록 문서를 보면 여러 길이, 부피, 무게 단위가 만들어져 있다. 이 중에 하나를 정해서 단위를 변환하는 앱을 구현한다.
 */

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
        resultLabel.text = "\(unitConverter.result)"
    }
}

