//
// String+Ext.swift
// Extension
//
// Create by wooseng with company's MackBook Pro on 2019/9/17.
// Copyright © 2019 残无殇. All rights reserved.
//


import Foundation

public extension String {
    
    /// 判断当前字符串是否是手机号
    var isPhoneNumber: Bool {
        guard count == 11 else {
            return false
        }
        do {
            let regex = try NSRegularExpression(pattern: "^1[3-9]\\d{9}$", options: [])
            let result = regex.matches(in: self, options: [], range: NSRange(location: 0, length: count))
            return !result.isEmpty
        } catch {
            return false
        }
    }
    
    /// 获取 URL 字符串中的参数，即问号后面的参数，如果字符串不能转为 URL，则返回 nil
    var urlComponents: [String: String]? {
        guard let url = URL(string: self) else {
            return nil
        }
        return url.queryComponents
    }
    
    /// 字符串是否包含emoji表情
    var containsEmoji: Bool {
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x1F600 ... 0x1F64F, // Emoticons
                 0x1F300 ... 0x1F5FF, // Misc Symbols and Pictographs
                 0x1F680 ... 0x1F6FF, // Transport and Map
                 0x1F1E6 ... 0x1F1FF, // Regional country flags
                 0x2600 ... 0x26FF, // Misc symbols
                 0x2700 ... 0x27BF, // Dingbats
                 0xFE00 ... 0xFE0F, // Variation Selectors
                 0x1F900 ... 0x1F9FF, // Supplemental Symbols and Pictographs
                 127000 ... 127600, // Various asian characters
                 65024 ... 65039, // Variation selector
                 9100 ... 9300, // Misc items
                 8400 ... 8447: // Combining Diacritical Marks for Symbols
                return true
            default:
                continue
            }
        }
        return false
    }
    
}

//MARK: - 颜色值处理
internal extension String {
    
    /// 将当前值转为十六进制颜色值，转换完成的格式为 FFFFFF
    ///
    /// 转换失败将返回默认颜色值 FFFFFF
    func toColorHex() -> String {
        let hex = uppercased().filter { "0123456789ABCDEF".contains($0) }
        switch hex.count {
        case 1: return String(repeating: hex, count: 6)
        case 3: return hex.reduce(into: "") {
            $0.append(String(repeating: $1, count: 2))
        }
        case 6: return hex
        default: return "FFFFFF"
        }
    }
    
    /// 将十六进制颜色值取反
    func reverseColorHex() -> String {
        let hex = toColorHex()
        guard let intCode = Int(hex, radix: 16) else {
            return hex
        }
        let r = 255 - (intCode >> 16) & 0xFF
        let g = 255 - (intCode >> 8) & 0xFF
        let b = 255 - intCode & 0xFF
        return [
            String(r, radix: 16, uppercase: true),
            String(g, radix: 16, uppercase: true),
            String(b, radix: 16, uppercase: true),
        ].map {
            $0.count == 1 ? String(repeating: $0, count: 2) : $0
        }.joined(separator: "")
    }
    
}
