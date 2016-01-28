//
//  ViewController.swift
//  HussainAemenFirstCalculator
//
//  Created by Aemen Hussain on 1/26/16.
//  Copyright © 2016 Aemen Hussain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var stillPicking = false
    var numbers : [Int] = []             /* declare array to hold multiple values to add */

    @IBOutlet weak var displayVal: UILabel!
    
    
    
    @IBAction func chosenNumber(sender: AnyObject) {
    
        let number = sender.titleLabel!!.text
        
        if stillPicking {
            
            displayVal.text = displayVal.text! + number!
        
        } else {
            
            displayVal.text = number
            stillPicking = true
        
        }
    }

    
    
    @IBAction func add(sender: AnyObject) {
        
        /* add case handling for crash that occurs if the first button pressed is "+" */
        
        if ( displayVal.text != "") {
            
            stillPicking = false
            numbers.append(Int(displayVal.text!)!)
            
        } else {
            
            stillPicking = true
        }
    }
    
    
    
    @IBAction func finalSum(sender: AnyObject) {
        
        /* add case handling for crash that occurs if the first button pressed is "=" */
        
        if ( displayVal.text != "") {
            
            stillPicking = false
            var sum = 0
            numbers.append(Int(displayVal.text!)!)
          
            for x in numbers {                /* iterate over all numbers in array to calculate sum */
                sum+=x
            }
           
            numbers.removeAll()               /* re-set numbers array so old values aren't used in the next sum */
            
            displayVal.text = "\(sum)"
            
        } else {
            
            stillPicking = true
        }
    }
    
    
    
    @IBAction func clear(sender: AnyObject) {
        
        /* add functionality for a clear button so that it's possible to restart calculator without restarting program */
        
        stillPicking = false
        numbers.removeAll()
        displayVal.text = "0"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

