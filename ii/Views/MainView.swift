//
//  MainView.swift
//  ii
//
//  Created by andriy_sergiyenko on 7/15/16.
//  Copyright © 2016 Airbnb. All rights reserved.
//

import UIKit

class MainView: UIView, UITextFieldDelegate {

    @IBOutlet weak var equalHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var amountField: UITextField!
    
    @IBAction func amountChanged(sender: AnyObject) {
        formatAmount()
        resetCursorPosition()
    }
    
    func changeHeight() {
        
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
    
    func formatAmount() {
        let before = amountField.text

        let amount = convertToDigitsOnly(amountField?.text)
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        amountField.text = formatter.stringFromNumber(amount)

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
    
    func resetCursorPosition() {
        let newPosition = amountField.endOfDocument
        amountField.selectedTextRange = amountField.textRangeFromPosition(newPosition, toPosition: newPosition)
    }
}
