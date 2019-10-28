//
// Date+Timestamp.swift
// Extension
//
// Create by wooseng with company's MackBook Pro on 2019/9/17.
// Copyright © 2019 残无殇. All rights reserved.
//


import Foundation

public extension Date {
    
    /**
     时间戳，以秒为单位
     
     此处选择 UInt32 作为返回值，能保证转换时不会超出最大值
     - timestamp = 1562464375 (每次获取都不一样，但是长度是一样的)
     - UInt32.max = 4294967295
     - UInt16.max = 65535
     */
    var timestamp: UInt32 {
        return UInt32(timeIntervalSince1970)
    }
    
    /**
     时间戳，以毫秒为单位
     
     此处使用 UInt64，才能保证将毫秒时间转换为整数时不会超出最大值
     - timestamp_milli = 1562464375545 (每次获取都不一样，但是长度是一样的)
     - UInt32.max = 4294967295
     - UInt64.max = 18446744073709551615
     */
    var timestamp_milli: UInt64 {
        return UInt64(timeIntervalSince1970 * 1000)
    }
    
}
