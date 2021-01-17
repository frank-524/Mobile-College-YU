//
//  ViewController.swift
//  apptest1
//
//  Created by mac08 on 12/11/20.
//  Copyright © 2020 mac08. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var FirstNumberTextEntry: UITextField!
    @IBOutlet weak var SecondNumberTestEntry: UITextField!
    
    @IBOutlet weak var calcTotal: UILabel!
    // Action. Also I connected the action
    @IBAction func ComputeTotal(_ sender: UITextField) {
        /*
           Check wheter a value has been entered by a user or not
        The best way to check is to use optional binding
        */
        if let firstNumberStr = FirstNumberTextEntry.text, let secondNumberStr = SecondNumberTestEntry.text{
            if let firstNumber = Int(firstNumberStr), let secondNumber = Int(secondNumberStr) {
                calcTotal.text = "\(firstNumber + secondNumber)"
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

