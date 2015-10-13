//
//  ViewController.swift
//  Calculator
//
//  Created by Longfei Li on 15/10/12.
//  Copyright © 2015年 Cody. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var output: UILabel!
    var userTouched : Bool = false
    
    @IBAction func digits(sender: UIButton) {
        let digits = sender.currentTitle!
        if userTouched{
            output.text = output.text! + digits
        }
        else{
            output.text = digits
            userTouched = true
        }
    }
}

