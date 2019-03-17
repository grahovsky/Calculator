//
//  ViewController.swift
//  Calculator
//
//  Created by Konstantin on 16/03/2019.
//  Copyright © 2019 Konstantin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFinishedTypingNumber: Bool = true
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            let isInt = floor(newValue) == newValue
            if isInt {
                displayLabel.text = "\(Int(newValue))"
            } else {
                displayLabel.text = "\(newValue)"
            }
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        guard let calcMethod = sender.currentTitle else { return }
        
        if calcMethod == "AC" {
            displayValue = 0
        } else if calcMethod == "%" {
            displayValue *= 0.01
        } else if calcMethod == "+/-" {
            displayValue *= -1
        }
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        guard let numValue = sender.currentTitle else { return }
        guard var labelText = displayLabel.text else { return }
        
        if isFinishedTypingNumber {
            if numValue == "." || numValue == "0" {
                labelText = "0."
            } else if labelText != "0" || numValue != "0" {
                labelText = numValue
            }

            isFinishedTypingNumber = false
        } else if numValue == "." {
            if !labelText.contains(".") {
                labelText.append(numValue)
            }
        } else {
            labelText.append(numValue)
        }
        
        displayLabel.text = labelText
        
    }
    
    
}

