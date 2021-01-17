//
//  Collateral.swift
//  MortgageCalculator
//
//  Created by mac08 on 12/16/20.
//  Copyright © 2020 mac08. All rights reserved.
//

import Foundation

class Collateral{
    var loanDuration: Int
    var loanAmount: Int
    var rateAPR: Double
    
    // Class must be initialized
    init(loanDuration: Int, loanAmount: Int, rateAPR: Double){
        self.loanAmount = loanAmount
        self.loanDuration = loanDuration
        self.rateAPR = rateAPR
    }
}

