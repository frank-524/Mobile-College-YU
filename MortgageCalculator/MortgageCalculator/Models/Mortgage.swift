//
//  Mortgage.swift
//  MortgageCalculator
//
//  Created by mac08 on 12/16/20.
//  Copyright © 2020 mac08. All rights reserved.
//

import Foundation

class Mortgage {
    // I copied this from navdeep
    public func computeMortgage(collateral: Collateral) -> Double {
    let interestRate = collateral.rateAPR/(100 * 12)
    return (Double(collateral.loanAmount) * interestRate) / (1 - pow(1/(1+interestRate), Double(collateral.loanDuration)))
    }
}

