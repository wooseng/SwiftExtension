//
// URLRequest+Ext.swift
// Footstone
//
// Create by wooseng with company's MackBook Pro on 2019/10/23.
// Copyright © 2019 上海稍息网络科技有限公司. All rights reserved.
//


import Foundation

public extension URLRequest {
    
    var httpBodyObject: Any? {
        guard let data = httpBody else {
            return nil
        }
        if let val = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
            return val
        } else if let val = String(data: data, encoding: .utf8) {
            return val
        }
        return nil
    }
    
}
