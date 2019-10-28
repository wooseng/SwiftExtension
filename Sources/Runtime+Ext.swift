//
// Runtime+Ext.swift
// Extension
//
// Create by wooseng with company's MackBook Pro on 2019/9/17.
// Copyright © 2019 残无殇. All rights reserved.
//


import Foundation

public func objc_setAssociatedObject(_ object: Any, _ key: String, _ value: Any?, _ policy: objc_AssociationPolicy) {
    guard let k = UnsafeRawPointer(bitPattern: key.hashValue) else {
        return
    }
    objc_setAssociatedObject(object, k, value, policy)
}

public func objc_getAssociatedObject(_ object: Any, _ key: String) -> Any? {
    guard let k = UnsafeRawPointer(bitPattern: key.hashValue) else {
        return nil
    }
    return objc_getAssociatedObject(object, k)
}
