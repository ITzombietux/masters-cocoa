//
//  ViewController.swift
//  HangeulSigyeApp
//
//  Created by zombietux on 2020/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var amLbl: UILabel!
    @IBOutlet weak var pmLbl: UILabel!
    @IBOutlet weak var sunOrMoon: UILabel!
    @IBOutlet weak var zeroLbl: UILabel!
    @IBOutlet weak var oneHourLbl: UILabel!
    @IBOutlet weak var twoHourLbl: UILabel!
    @IBOutlet weak var threeHourLbl: UILabel!
    @IBOutlet weak var fourHourLbl: UILabel!
    @IBOutlet weak var fiveHourLbl: UILabel!
    @IBOutlet weak var firstSixHourLbl: UILabel!
    @IBOutlet weak var secondSixHourLbl: UILabel!
    @IBOutlet weak var firstSevenHourLbl: UILabel!
    @IBOutlet weak var secondSevenHourLbl: UILabel!
    @IBOutlet weak var firstEightHourLbl: UILabel!
    @IBOutlet weak var secondEightHourLbl: UILabel!
    @IBOutlet weak var firstNineHourLbl: UILabel!
    @IBOutlet weak var secondNineHourLbl: UILabel!
    @IBOutlet weak var tenHourLbl: UILabel!
    @IBOutlet weak var oneMinuteLbl: UILabel!
    @IBOutlet weak var twoMinuteLbl: UILabel!
    @IBOutlet weak var threeMinuteLbl: UILabel!
    @IBOutlet weak var fourMinuteLbl: UILabel!
    @IBOutlet weak var fiveMinuteLbl: UILabel!
    @IBOutlet weak var sixMinuteLbl: UILabel!
    @IBOutlet weak var sevenMinuteLbl: UILabel!
    @IBOutlet weak var eightMinuteLbl: UILabel!
    @IBOutlet weak var nineMinuteLbl: UILabel!
    @IBOutlet weak var tenMinuteLbl: UILabel!
    @IBOutlet weak var twoOfTensMinuteLbl: UILabel!
    @IBOutlet weak var threeOfTensMinuteLbl: UILabel!
    @IBOutlet weak var fourOfTensMinuteLbl: UILabel!
    @IBOutlet weak var fiveOfTensMinuteLbl: UILabel!
    @IBOutlet weak var secondLbl: UILabel!
    
    private var hourLbls = [UILabel]()
    private var minuteLbls = [UILabel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hourLbls = [zeroLbl, oneHourLbl, twoHourLbl, threeHourLbl, fourHourLbl, fiveHourLbl, firstSixHourLbl, secondSixHourLbl, firstSevenHourLbl, secondSevenHourLbl, firstEightHourLbl, secondEightHourLbl, firstNineHourLbl, secondNineHourLbl, tenHourLbl]
        
        minuteLbls = [zeroLbl, oneMinuteLbl, twoMinuteLbl, threeMinuteLbl, fourMinuteLbl, fiveMinuteLbl, sixMinuteLbl, sevenMinuteLbl, eightMinuteLbl, nineMinuteLbl, tenMinuteLbl, twoOfTensMinuteLbl, threeOfTensMinuteLbl, fourOfTensMinuteLbl, fiveOfTensMinuteLbl]
        
        timer()
    }

    func timer() {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true )
    }

    @objc func update() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "a"
        
        let date = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        let hangeulSigye = HangeulSigye(apPm: dateFormatter.string(from: date), hour: hour, minute: minute, second: second)
        let hangeulSigyeTime = hangeulSigye.make()
    
        displayAmPm(amPm: hangeulSigyeTime[0])
        displayHour(hour: hangeulSigyeTime[1], hourLbls: self.hourLbls)
        displayMinute(minute: hangeulSigyeTime[2], minuteLbls: self.minuteLbls)
        displaySecond(second: hangeulSigyeTime[3])
        displaySunOrMoon(sunOrMoon: hangeulSigyeTime[4])
    }
    
    private func displayAmPm(amPm: String) {
        guard amPm == "AM" else {
            amLbl.textColor = .systemGray
            pmLbl.textColor = .white
            return
        }
        
        amLbl.textColor = .white
        pmLbl.textColor = .systemGray
    }
    
    private func displayHour(hour: String, hourLbls: [UILabel]) {
        let hourChars = hour.map { String($0) }
        
        for hourLbl in hourLbls {
            hourLbl.textColor = .systemGray
            
            for hourChar in hourChars {
                if hourLbl.text == hourChar {
                    hourLbl.textColor = .white
                    minuteExceptionHandling(hourChars: hourChars)
                }
            }
        }
    }
    
    private func displayMinute(minute: String, minuteLbls: [UILabel]) {
        let minuteChars = minute.map { String($0) }
        
        for minuteLbl in minuteLbls {
            minuteLbl.textColor = .systemGray
            
            for minuteChar in minuteChars {
                if minuteLbl.text == minuteChar {
                    minuteLbl.textColor = .white
                    
                    minuteExceptionHandling(minute: minute, minuteChars: minuteChars)
                }
            }
        }
    }
    
    private func displaySecond(second: String) {
        let secondChars = second.map { String($0) }
        switch second.count {
        case 2:
            secondLbl.text = "\(secondChars[0])\(secondChars[1])"
        case 3:
            secondLbl.text = "\(secondChars[0])\n\(secondChars[1])\(secondChars[2])"
        default:
            secondLbl.text = "\(secondChars[0])\(secondChars[1])\n\(secondChars[2])\(secondChars[3])"
        }
    }
    
    private func displaySunOrMoon(sunOrMoon: String) {
        self.sunOrMoon.text = sunOrMoon
    }
    
    private func minuteExceptionHandling(hourChars: [String]) {
        if hourChars.contains("섯") {
            firstEightHourLbl.textColor = .systemGray
        } else {
            firstSixHourLbl.textColor = .systemGray
        }
    }
    
    private func minuteExceptionHandling(minute: String, minuteChars: [String]) {

        if minute.count == 1 {
            minuteOverlapHandling(isTens: true)
        }
        
        if minute.count == 2 && minuteChars[0] == "십" {
            minuteOverlapHandling(isTens: true)
        }
        
        if minute.count == 2 && minuteChars[0] != "십" {
            minuteOverlapHandling(isTens: false)
        }

        if minute.count == 3 && minuteChars[0] != minuteChars[2] {
            if minuteChars[0] == "이" && (minuteChars[2] == "삼" || minuteChars[2] == "사" || minuteChars[2] == "오") {
                twoMinuteLbl.textColor = .systemGray
                threeOfTensMinuteLbl.textColor = .systemGray
                fourOfTensMinuteLbl.textColor = .systemGray
                fiveOfTensMinuteLbl.textColor = .systemGray
            } else if minuteChars[0] == "삼" && (minuteChars[2] == "이" || minuteChars[2] == "사" || minuteChars[2] == "오") {
                threeMinuteLbl.textColor = .systemGray
                twoOfTensMinuteLbl.textColor = .systemGray
                fourOfTensMinuteLbl.textColor = .systemGray
                fiveOfTensMinuteLbl.textColor = .systemGray
            } else if minuteChars[0] == "사" && (minuteChars[2] == "삼" || minuteChars[2] == "이" || minuteChars[2] == "오") {
                fourMinuteLbl.textColor = .systemGray
                threeOfTensMinuteLbl.textColor = .systemGray
                twoOfTensMinuteLbl.textColor = .systemGray
                fiveOfTensMinuteLbl.textColor = .systemGray
            } else if minuteChars[0] == "오" && (minuteChars[2] == "삼" || minuteChars[2] == "사" || minuteChars[2] == "이") {
                fiveMinuteLbl.textColor = .systemGray
                threeOfTensMinuteLbl.textColor = .systemGray
                fourOfTensMinuteLbl.textColor = .systemGray
                twoOfTensMinuteLbl.textColor = .systemGray
            } else {
                minuteOverlapHandling(isTens: false)
            }
        }
    }
    
    private func minuteOverlapHandling(isTens: Bool) {
        if isTens {
            twoOfTensMinuteLbl.textColor = .systemGray
            threeOfTensMinuteLbl.textColor = .systemGray
            fourOfTensMinuteLbl.textColor = .systemGray
            fiveOfTensMinuteLbl.textColor = .systemGray
        } else {
            twoMinuteLbl.textColor = .systemGray
            threeMinuteLbl.textColor = .systemGray
            fourMinuteLbl.textColor = .systemGray
            fiveMinuteLbl.textColor = .systemGray
        }
    }
}
