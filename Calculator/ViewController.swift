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
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert display label text to a Double.")
        }
        guard let operation = sender.currentTitle else { return }
        
        if operation == "AC" {
            displayLabel.text = "0"
        }
        
        if operation == "%" {
            displayLabel.text = "\(number/100)"
        }
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        guard let numValue = sender.currentTitle else { return }
        guard var labelText = displayLabel.text else { return }
        
        if isFinishedTypingNumber {
            if numValue == "." || numValue == "0" {
                labelText = "0."
            } else {
                if labelText != "0" || numValue != "0" {
                    labelText = numValue
                }
            }
            isFinishedTypingNumber = false
        }
        else {
            if !labelText.contains(".") {
                labelText.append(numValue)
            } else {
                if numValue != "." {
                    labelText.append(numValue)
                }
            }
        }
        
        displayLabel.text = labelText
        
    }
    
    
}

