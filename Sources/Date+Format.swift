//
// Date_Format.swift
// Footstone
//
// Create by wooseng with company's MackBook Pro on 2019/10/22.
// Copyright © 2019 上海稍息网络科技有限公司. All rights reserved.
//
//
//


import Foundation

public extension Date {
    
    // 将日期字符串根据指定的格式进行初始化
    init?(_ dateString: String, fmt: String = "yyyy-MM-dd HH:mm:ss") {
        self.init()
        guard let date = DateFormatter(fmt).date(from: dateString) else {
            return nil
        }
        self = date
    }
    
    /// 使用年月日时分秒进行初始化
    init?(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) {
        self.init("\(year)-\(month)-\(day) \(hour):\(minute):\(second)")
    }
    
    /// 根据指定的样式进行格式化
    func format(_ fmt: String = "yyyy-MM-dd HH:mm:ss") -> String {
        return DateFormatter(fmt).string(from: self)
    }
    
    /// 当前日期的最小时间，即当天的 00:00:00
    var minTime: Date? {
        let components = Calendar(identifier: .gregorian).dateComponents(Set([.year, .month, .day]), from: self)
        guard let year = components.year,
            let month = components.month,
            let day = components.day else {
                return nil
        }
        return Date(year: year, month: month, day: day, hour: 0, minute: 0, second: 0)
    }
    
    /// 当前日期的最大时间，即当天的 23:59:59
    var maxTime: Date? {
        let components = Calendar(identifier: .gregorian).dateComponents(Set([.year, .month, .day]), from: self)
        guard let year = components.year,
            let month = components.month,
            let day = components.day else {
                return nil
        }
        return Date(year: year, month: month, day: day, hour: 23, minute: 59, second: 59)
    }
    
}

public extension DateFormatter {
    
    /// 使用一个格式样式和时区进行初始化
    convenience init(_ fmt: String, timeZone: TimeZone? = TimeZone(identifier: "Asia/Shanghai")) {
        self.init()
        dateFormat = fmt
        locale = Locale(identifier: "zh_CN")
        self.timeZone = timeZone ?? TimeZone.current
    }
    
}
