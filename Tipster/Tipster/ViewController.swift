//
//  ViewController.swift
//  Tipster
//
//  Created by J on 7/08/2018.
//  Copyright © 2018 Jman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var lowTipPercentLabel: UILabel!
    @IBOutlet weak var medTipPercentLabel: UILabel!
    @IBOutlet weak var topTipPercentLabel: UILabel!
    
    @IBOutlet weak var lowTALabel: UILabel!
    @IBOutlet weak var medTALabel: UILabel!
    @IBOutlet weak var topTALabel: UILabel!
    
    @IBOutlet weak var lowTotalLabel: UILabel!
    @IBOutlet weak var medTotalLabel: UILabel!
    @IBOutlet weak var topTotalLabel: UILabel!
    
    
    @IBOutlet weak var groupSizeLabel: UILabel!
    
    
    var sum = 0.0
    var decimalPressed = false
    var dotCount = 0.0
    
    var tipPercent = 10
    var groupSize = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateOutput()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    
    func updateOutput() {
        print("updateOutput() called")
        if !decimalPressed {
            outputLabel.text = "\(Int(sum))"
        }
        else if decimalPressed && dotCount == 0 {
            outputLabel.text = "\(Int(sum))."
        }
        else {
            outputLabel.text = "\(sum)"
        }
        
        let doubleTip = Double(tipPercent)
        
        lowTipPercentLabel.text = "\(tipPercent-5)%"
        medTipPercentLabel.text = "\(tipPercent)%"
        topTipPercentLabel.text = "\(tipPercent+5)%"

        let lowTip = sum * (doubleTip-5) / 100
        let medTip = sum * (doubleTip) / 100
        let topTip = sum * (doubleTip+5) / 100
        
        lowTALabel.text = "\(lowTip)"
        medTALabel.text = "\(medTip)"
        topTALabel.text = "\(topTip)"
        
        lowTotalLabel.text = "\(sum + lowTip)"
        medTotalLabel.text = "\(sum + medTip)"
        topTotalLabel.text = "\(sum + topTip)"


        
    }
    
    

    @IBAction func numPressed(_ sender: UIButton) {
        print(sender.tag)
        if !decimalPressed {
            sum *= 10
            sum += Double(sender.tag)
        } else {
            if dotCount >= 2 { return }
            dotCount += 1
            let val = Double(sender.tag) / pow(10, dotCount)
            sum += val
        }
        updateOutput()
    }
    
    
    @IBAction func clearPressed(_ sender: UIButton) {
        print("pressed CLEAR")
        sum = 0.0
        dotCount = 0
        decimalPressed = false
        updateOutput()
    }
    
    
    @IBAction func dotPressed(_ sender: UIButton) {
        print("pressed DOT")
        decimalPressed = true
        updateOutput()
    }
    
    @IBAction func tipChanged(_ sender: UISlider) {
        print("tipChanged =>", Int(sender.value))
        tipPercent = Int(sender.value)
        updateOutput()
    }
    
    @IBAction func groupChanged(_ sender:
        UISlider) {
        print("groupChanged =>", Int(sender.value))
//        groupSizeLabel.text = "Group Size: \(groupSize)"
        groupSize = Int(sender.value)
        updateOutput()
    }
    
}

