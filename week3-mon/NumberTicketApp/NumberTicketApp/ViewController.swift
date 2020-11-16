//
//  ViewController.swift
//  NumberTicketApp
//
//  Created by zombietux on 2020/11/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var waitingNumberLabel: UILabel!
    @IBOutlet weak var waitingPercent: UIProgressView!
    @IBOutlet weak var waitingButton: UIButton!
    @IBOutlet weak var completeButtom: UIButton!
    
    var numberTicket = NumberTicket()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func waitingButtonTapped(_ sender: Any) {
        numberTicket.waitingNumberUp()
        updateUI()
    }
    
    @IBAction func completeButtonTapped(_ sender: Any) {
        numberTicket.waitingNumberDown()
        updateUI()
    }
    
    private func updateUI() {
        updateWaitingNumber(for: numberTicket)
        updateButtonState(for: numberTicket)
    }
    
    private func updateWaitingNumber(for numberTicket: NumberTicket) {
        waitingNumberLabel.text = "\(numberTicket.waitingNumber)명"
        waitingPercent.progress = numberTicket.waitingPercent.ratio
        updateButtonState(for: numberTicket)
    }
    
    private func updateButtonState(for numberTicket: NumberTicket) {
        let buttonState = (numberTicket.enableWaiting, numberTicket.enableComplete)
        
        switch buttonState {
        case (false, true):
            waitingButton.isEnabled = false
            completeButtom.isEnabled = true
        case (true, false):
            waitingButton.isEnabled = true
            completeButtom.isEnabled = false
        case (true, true):
            waitingButton.isEnabled = true
            completeButtom.isEnabled = true
        default:
            break
        }
    }
}

