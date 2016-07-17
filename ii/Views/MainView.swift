//
//  MainView.swift
//  ii
//
//  Created by andriy_sergiyenko on 7/15/16.
//  Copyright © 2016 Airbnb. All rights reserved.
//

import UIKit

class MainView: UIView, UITextFieldDelegate {
    
    var amount: Double = 0
    
    let percents = [0.15, 0.18, 0.20, 0.25]
    
    var currentPercent: Double {
        return percents[percentField.selectedSegmentIndex]
    }

    @IBOutlet weak var amountField: UITextField!
    
    @IBOutlet weak var amountFieldHeight: NSLayoutConstraint!
    
    @IBOutlet weak var amountFieldVerticalPosition: NSLayoutConstraint!

    @IBOutlet weak var percentField: UISegmentedControl!
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var tipAmount: UILabel!
    
    @IBOutlet weak var onePersonAmountWithTip: UILabel!
    
    @IBOutlet weak var twoPersonsAmountWithTip: UILabel!
    
    @IBOutlet weak var threePersonsAmountWithTip: UILabel!
    
    @IBOutlet weak var fourPersonsAmountWithTip: UILabel!
    
    @IBOutlet var bodyStyleLabels: [UILabel]!
    
    @IBAction func amountChanged(sender: AnyObject) {
        parseAmount()
        formatAmount()
        computeTips()
        layoutViews()
        resetCursorPosition()
    }
    
    @IBAction func percentChanged(sender: AnyObject) {
        computeTips()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layoutViews()
    }
    
    func activateAmountField() {
        addDoneButton()
        amountField.becomeFirstResponder()
    }
    
    func addDoneButton() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace,
                                            target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .Done,
                                            target: self, action: #selector(UIView.endEditing(_:)))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        amountField.inputAccessoryView = keyboardToolbar
    }
    
    func setInitialTip(tipIndex: Int) {
        percentField.selectedSegmentIndex = tipIndex
    }
    
    func setInitialAmount(amount: Double) {
        self.amount = amount
        formatAmount()
    }
    
    func parseAmount() {
        amount = convertToDigitsOnly(amountField?.text)
        Settings.lastAmount = amount
        Settings.lastAmountUpdatedOn = NSDate()
    }
    
    func formatAmount() {
        let before = amountField.text

        amountField.text = formatCurrency(amount)

        let after = amountField.text
        print("before: \(before); after: \(after)")
    }
    
    func convertToDigitsOnly(amountString: String!) -> Double {
        let digitsOnlyArray = amountField.text!.componentsSeparatedByCharactersInSet(
            NSCharacterSet.decimalDigitCharacterSet().invertedSet)
        
        let digitsOnlyString = digitsOnlyArray.joinWithSeparator("")
        let amount = Double(digitsOnlyString)
        return amount == nil ? 0 : amount! / 100
    }
    
    func formatCurrency(amount: Double) -> String {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        return formatter.stringFromNumber(amount)!
    }
    
    func computeTips() {
        let tip = amount * currentPercent
        let amountWithTip = amount + tip
        
        tipAmount.text = formatCurrency(tip)
        onePersonAmountWithTip.text = formatCurrency(amountWithTip)
        twoPersonsAmountWithTip.text = formatCurrency(amountWithTip / 2)
        threePersonsAmountWithTip.text = formatCurrency(amountWithTip / 3)
        fourPersonsAmountWithTip.text = formatCurrency(amountWithTip / 4)
    }
    
    func layoutViews() {
        self.layoutIfNeeded()
        
        let zeroAmount = amount == 0
        let amountNonZeroHeight = CGFloat(160)
        let amountZeroVerticalOffset = CGFloat(-24)
        
        amountFieldHeight.constant = zeroAmount ? (self.superview?.bounds.height)! / 2 : amountNonZeroHeight
        amountFieldVerticalPosition.constant = zeroAmount ? 0 : amountZeroVerticalOffset
        
        UIView.animateWithDuration(0.3) {
            self.percentField.alpha = zeroAmount ? 0 : 1
            self.bottomView.alpha = zeroAmount ? 0 : 1
            self.layoutIfNeeded()
        }
    }
    
    func resetCursorPosition() {
        let newPosition = amountField.endOfDocument
        amountField.selectedTextRange = amountField.textRangeFromPosition(newPosition, toPosition: newPosition)
    }
    
    func adjustFonts() {
        for label in bodyStyleLabels {
            label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        }
        
        onePersonAmountWithTip.font = UIFont.preferredFontForTextStyle(UIFontTextStyleTitle1)
        twoPersonsAmountWithTip.font = UIFont.preferredFontForTextStyle(UIFontTextStyleTitle2)
        threePersonsAmountWithTip.font = UIFont.preferredFontForTextStyle(UIFontTextStyleTitle3)
    }
}
