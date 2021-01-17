//
//  ViewController.swift
//  MortgageCalculator
//
//  Created by mac08 on 12/16/20.
//  Copyright © 2020 mac08. All rights reserved.
//

import UIKit

enum LoanDuration: String{
    case select = "Select A Duration"
    case fifteenYears = "15 Years"
    case thirtyYears = "30 Years"
    
}
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let durationOptions = [LoanDuration.select.rawValue, LoanDuration.fifteenYears.rawValue, LoanDuration.thirtyYears.rawValue]
    
    var rateMap: [String: Double] = [:]
    
    var loanAmount: Int = 300000
    var rate: Double = 100.0
    var tenure: Int = 30 * 12
    
    @IBOutlet weak var homeValueTxtEntry: UITextField!
    @IBOutlet weak var downPymtTxtEntry: UITextField!
    @IBOutlet weak var mortgageAmt: UILabel!
    @IBOutlet weak var rateAPR: UILabel!
    @IBOutlet weak var loanDurationPicker: UIPickerView!
    @IBOutlet weak var mortgageLbl: UILabel!
    
    @IBAction func computeMortgageAmt(_ sender: UITextField) {
        if let homeValueStr = homeValueTxtEntry.text, let downPaymentStr = downPymtTxtEntry.text {
            if let homeValue = Int(homeValueStr), let downPayment = Int(downPaymentStr){
                loanAmount = homeValue - downPayment
                mortgageAmt.text = "$\(loanAmount)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateRateMap()
        // Do any additional setup after loading the view.
        loanDurationPicker.delegate = self
        loanDurationPicker.delegate = self
    }
    
    private func populateRateMap() {
        for duration in durationOptions {
            switch duration {
            case LoanDuration.fifteenYears.rawValue:
                rateMap[LoanDuration.fifteenYears.rawValue] = 2.75
            case LoanDuration.thirtyYears.rawValue:
                rateMap [LoanDuration.thirtyYears.rawValue] = 3.00
            default:
                rateMap [LoanDuration.select.rawValue] = 100
            }
        }
    }
    
    // The following functions are for the picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return durationOptions.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return durationOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // By default you will get an optional back
        switch durationOptions[row] {
        case LoanDuration.fifteenYears.rawValue:
            self.tenure = 15 * 12
        case LoanDuration.thirtyYears.rawValue:
            self.tenure = 30 * 12
        default:
            // In reality the you would NOT want to create a default tenure
            self.tenure = 30 * 12
        }
        
        if let currentRate = rateMap[durationOptions[row]] {
            self.rate = currentRate
            rateAPR.text = "\(currentRate)%"
        }
    }
    
    @IBAction func computeMortgage(_ sender: UIButton) {
        mortgageLbl.text = "Monthly Mortgage Amount is: $\(String(format: "%.2f", Mortgage().computeMortgage(collateral: self.createCollateralModel())))"
        
    }
    
    @IBAction func reset(_ sender: Any) {
        homeValueTxtEntry.text = ""
        downPymtTxtEntry.text = ""
        mortgageAmt.text = ""
        mortgageLbl.text = ""
    }
    
    
    private func createCollateralModel() -> Collateral{
        return Collateral(loanDuration: self.tenure, loanAmount: self.loanAmount, rateAPR: self.rate)
    }
    
    

}

