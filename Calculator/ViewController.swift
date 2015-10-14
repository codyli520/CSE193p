//
//  ViewController.swift
//  Calculator
//
//  Created by Longfei Li on 15/10/12.
//  Copyright © 2015年 Cody. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController {

    @IBOutlet weak var output: UILabel!
    var userTyping = false
    
    @IBAction func digits(sender: UIButton) {
        let digits = sender.currentTitle!
        if userTyping{
            output.text = output.text! + digits
        }
        else{
            output.text = digits
            userTyping = true
        }
    }
    
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userTyping = false
        operandStack.append(displayValue)
        print("operant stack = \(operandStack)")
    }
    
    var displayValue: Double{
        get{
            return NSNumberFormatter().numberFromString(output.text!)!.doubleValue
        }
        set{
            output.text = "\(newValue)"
            userTyping = false
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userTyping{
            enter()
        }
        
        switch operation{
        case "+": performOperation{$0 + $1}
        case "−": performOperation{$1 - $0}
        case "×": performOperation{$0 * $1}
        case "÷": performOperation{$1 / $0}
        case "sin": performOperation{sin($0)}
        case "cos": performOperation{cos($0)}
        case "π":
            displayValue = M_PI
            enter()
        case "√": performOperation{sqrt($0)}
        default: break
            }
        
    }
    func performOperation(operation:(Double,Double)->Double){
        if operandStack.count>=2{
            displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
            enter()
        }
    }
    
    @objc(method2:)
    func performOperation(operation:(Double)->Double){
        if operandStack.count>=1{
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
   
}

