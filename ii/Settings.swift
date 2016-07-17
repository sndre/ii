//
//  Settings.swift
//  ii
//
//  Created by andriy_sergiyenko on 7/17/16.
//  Copyright © 2016 Airbnb. All rights reserved.
//

import Foundation

class Settings {
    
    static var amountRetentionIntervalInMinutes: Int {
        return 10
    }
    
    static var defaultTipIndex: Int {
        get {
            return getValue("defaultTipIndex", defaultValue: 0)
        }
        set(value) {
            setValue("defaultTipIndex", value: value)
        }
    }

    static var lastAmount: Double {
        get {
            return getValue("lastAmount", defaultValue: 0.0)
        }
        set(value) {
            setValue("lastAmount", value: value)
        }
    }
    
    static var lastAmountUpdatedOn: NSDate {
        get {
            return getValue("lastAmountUpdatedOn", defaultValue: NSDate())
        }
        set(value) {
            setValue("lastAmountUpdatedOn", value: value)
        }
    }
    
    private init() {
    }
    
    private static func getValue<T>(key: String, defaultValue: T) -> T {
        let store = NSUserDefaults.standardUserDefaults();
        let anyObject: AnyObject? = store.objectForKey(key) as AnyObject?
        
        if let value = anyObject as? T {
            return value
        }
        else {
            return defaultValue
        }
    }
    
    private static func setValue(key: String, value: AnyObject) {
        let store = NSUserDefaults.standardUserDefaults();
        store.setObject(value, forKey: key)
        store.synchronize()
    }
}