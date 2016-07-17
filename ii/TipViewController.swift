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
        
        mainView.formatAmount()
        subsribeToRegionFormatChange()
    }

    override func viewDidAppear(animated: Bool) {
        mainView.activateAmountField()
    }
    
    func subsribeToRegionFormatChange() {
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector:#selector(receiveRegionFormatChangeNotification),
            name:NSCurrentLocaleDidChangeNotification,
            object:nil);
    }
    
    func receiveRegionFormatChangeNotification() {
        mainView.formatAmount()
        mainView.computeTips()
    }

}

