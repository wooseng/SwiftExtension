//
// Data+Hex.swift
// Footstone
//
// Create by wooseng with company's MackBook Pro on 2019/10/23.
// Copyright © 2019 上海稍息网络科技有限公司. All rights reserved.
//


import Foundation

public extension Data {
    
    var hexString: String {
        return Array(self).reduce("") {
            var s = String($1, radix: 16, uppercase: true)
            if s.count == 1 {
                s = "0" + s
            }
            return $0 + s
        }
    }
    
}
