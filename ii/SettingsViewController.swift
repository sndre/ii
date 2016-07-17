//
//  SettingsViewController.swift
//  ii
//
//  Created by andriy_sergiyenko on 7/14/16.
//  Copyright © 2016 Airbnb. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultPercentField: UISegmentedControl!
    
    @IBAction func defaultPercentChanged(sender: AnyObject) {
        Settings.defaultTipIndex = defaultPercentField.selectedSegmentIndex
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        defaultPercentField.selectedSegmentIndex = Settings.defaultTipIndex
    }

}
