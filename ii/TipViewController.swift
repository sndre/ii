//
//  ViewController.swift
//  ii
//
//  Created by andriy_sergiyenko on 7/14/16.
//  Copyright © 2016 Airbnb. All rights reserved.
//

import UIKit

class TipViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var mainView: MainView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.setInitialAmount(getLastAmount())
        subsribeToRegionFormatChange()
        subsribeToDynamicFontChange()
        mainView.setInitialTip(Settings.defaultTipIndex)
    }

    override func viewDidAppear(animated: Bool) {
        mainView.activateAmountField()
        mainView.amountChanged("")
    }
    
    func getLastAmount() -> Double {
        let secondsInterval = NSDate().timeIntervalSinceDate(Settings.lastAmountUpdatedOn)
        let secondsInMinute = 60.0;
        let minutesInterval = secondsInterval / secondsInMinute;
        return Int(minutesInterval) >= Settings.amountRetentionIntervalInMinutes ? 0 : Settings.lastAmount
    }
    
    func subsribeToRegionFormatChange() {
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector:#selector(receiveRegionFormatChangeNotification),
            name:NSCurrentLocaleDidChangeNotification,
            object:nil);
    }
    
    func subsribeToDynamicFontChange() {
        NSNotificationCenter.defaultCenter().addObserver(self,
             selector:#selector(receiveDynamicFontChangeNotification),
             name:UIContentSizeCategoryDidChangeNotification,
             object:nil);
    }
    
    func receiveRegionFormatChangeNotification() {
        mainView.formatAmount()
        mainView.computeTips()
    }
    
    func receiveDynamicFontChangeNotification() {
        mainView.adjustFonts()
    }

}

