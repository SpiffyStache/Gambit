//
//  ViewController.swift
//  Gambit
//
//  Created by Robbie on 8/23/17.
//  Copyright © 2017 Robbie. All rights reserved.
//

import UIKit

class BattleViewController: UIViewController {

    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var attackButton: UIButton!
    @IBOutlet weak var counterButton: UIButton!
    @IBOutlet weak var defendButton: UIButton!
    @IBOutlet weak var announcerLabel: UILabel!
    
    var attackTaps = 0
    var defendTaps = 0
    var counterTaps = 0
    var playerHP = 100
    
    var attackOrSendTaps = 0

    
    var actionsArray = [Int]()

    
    var actionSelector = ""
    var startTime = Date()
    
    private var roundTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        disableActionbutton()
        beginDuel()
    }

    func beginDuel() {
        attackTaps = 0
        defendTaps = 0
        counterTaps = 0
        announcerLabel.text = "ROUND 1!"
        
        roundTimer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (Timer) in
            self.actionsArray.append(self.attackTaps)
            self.actionsArray.append(self.defendTaps)
            self.actionsArray.append(self.counterTaps)
            
            self.disableActionbutton()
            self.disableAttackButton()
            self.disableDefendButton()
            self.disableCounterButton()
            self.announcerLabel.text = "COMPLETE!"
            
            print(self.actionsArray)
            print() //time remaining (should be 0 for this func)
        }
    }
        
    func sendAttack() {
        disableActionbutton()
        
        self.actionsArray.append(self.attackTaps)
        self.actionsArray.append(self.defendTaps)
        self.actionsArray.append(self.counterTaps)
        
        print(actionsArray)
        print() //time remaining (player with the higher time remaining is the faster player)
        
        self.roundTimer?.stop()
        self.roundTimer = nil
        self.announcerLabel.text = "COMPLETE!"

    }
    
    func enableActionbutton() {
        self.actionButton.isHidden = false
        self.actionButton.isEnabled = true
    }
    
    func disableActionbutton() {
        self.actionButton.isHidden = true
        self.actionButton.isEnabled = false
    }
    
    func enableAttackButton() {
        attackButton.isHidden = false
        attackButton.isEnabled = true
    }
    
    func disableAttackButton() {
        attackButton.isHidden = true
        attackButton.isEnabled = false
    }
    
    func enableDefendButton() {
        defendButton.isHidden = false
        defendButton.isEnabled = true
    }
    
    func disableDefendButton() {
        defendButton.isHidden = true
        defendButton.isEnabled = false
    }
    
    func enableCounterButton() {
        counterButton.isHidden = false
        counterButton.isEnabled = true
    }
    
    func disableCounterButton() {
        counterButton.isHidden = true
        counterButton.isEnabled = false
    }
    
    @IBAction func attackButtonPressed(_ sender: Any) {
        
        //poorly named variable that describes if you are tapping the attack button or the send button
        attackOrSendTaps += 1
        if attackOrSendTaps == 1 {
            actionButton.setTitle("ATTACK!", for: .normal)
            actionSelector = "attack"
            enableActionbutton()
            
            attackButton.setTitle("Send!", for: .normal)

            disableDefendButton()
            disableCounterButton()
        }
        if attackOrSendTaps == 2 {
            sendAttack()
            disableAttackButton()
        }
    }
    
    @IBAction func defendButtonPressed(_ sender: Any) {
        actionButton.setTitle("DEFEND!", for: .normal)
        actionSelector = "defend"
        enableActionbutton()
        
        disableAttackButton()
        disableCounterButton()
        disableDefendButton()
    }

    @IBAction func counterButtonPressed(_ sender: Any) {
        actionButton.setTitle("COUNTER!", for: .normal)
        actionSelector = "counter"
        enableActionbutton()
        
        disableAttackButton()
        disableDefendButton()
        disableCounterButton()
        
    }
    
    @IBAction func actionButtonPressed(_ sender: Any) {
        
        if actionSelector == "attack" {
            attackTaps += 1
            print("\(attackTaps)")
        }
        
        if actionSelector == "defend" {
            defendTaps += 1
            print("\(defendTaps)")
        }
        
        if actionSelector == "counter" {
            counterTaps += 1
            print("\(counterTaps)")
        }
    }
}

