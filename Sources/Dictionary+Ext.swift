//
// Ext_Array.swift
// API
//
// Create by wooseng with company's MackBook Pro on 2019/7/12.
// Copyright © 2019 waiting. All rights reserved.
//


import Foundation

internal extension Dictionary {
    
    mutating func set(_ value: Value?, forkey key: Key) {
        if let val = value {
            self[key] = val
        } else {
            removeValue(forKey: key)
        }
    }
    
}
