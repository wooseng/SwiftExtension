//
// UIDevice+Model.swift
// Extension
//
// Create by wooseng with company's MackBook Pro on 2019/9/17.
// Copyright © 2019 残无殇. All rights reserved.
//


import UIKit

public extension UIDevice {
    
    /// 获取设备的具体型号，例如: iPhone X，获取失败或者该设备型号未收录返回 nil
    var specificModel: String? {
        let key = "com.wooseng.extension.device.specificmodel.key"
        if let val = UserDefaults.standard.string(forKey: key) {
            return val
        }
        guard let val = getSpecificModel() else {
            return nil
        }
        UserDefaults.standard.set(val, forKey: key)
        return val
    }
    
    // 获取具体型号，数据来源: https://www.theiphonewiki.com/wiki/Models
    private func getSpecificModel() -> String? {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machine = Mirror(reflecting: systemInfo.machine)
        let identifier = machine.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }

        switch identifier {
        // iPod touch
        case "iPod1,1": return "iPod touch"
        case "iPod2,1": return "iPod touch 2"
        case "iPod3,1": return "iPod touch 3"
        case "iPod4,1": return "iPod touch 4"
        case "iPod5,1": return "iPod Touch 5"
        case "iPod7,1": return "iPod Touch 6"
        case "iPod9,1": return "iPod Touch 7"

        // iPhone
        case "iPhone1,1": return "iPhone"
        case "iPhone1,2": return "iPhone 3G"
        case "iPhone2,1": return "iPhone 3GS"
        case "iPhone3,1",
             "iPhone3,2",
             "iPhone3,3": return "iPhone 4"
        case "iPhone4,1": return "iPhone 4s"
        case "iPhone5,1",
             "iPhone5,2": return "iPhone 5"
        case "iPhone5,3",
             "iPhone5,4": return "iPhone 5c"
        case "iPhone6,1",
             "iPhone6,2": return "iPhone 5s"
        case "iPhone7,1": return "iPhone 6 Plus"
        case "iPhone7,2": return "iPhone 6"
        case "iPhone8,1": return "iPhone 6s"
        case "iPhone8,2": return "iPhone 6s Plus"
        case "iPhone8,4": return "iPhone SE"
        case "iPhone9,1",
             "iPhone9,3": return "iPhone 7"
        case "iPhone9,2",
             "iPhone9,4": return "iPhone 7 Plus"
        case "iPhone10,1",
             "iPhone10,4": return "iPhone 8"
        case "iPhone10,2",
             "iPhone10,5": return "iPhone 8 Plus"
        case "iPhone10,3",
             "iPhone10,6": return "iPhone X"
        case "iPhone11,2": return "iPhone XS"
        case "iPhone11,4",
             "iPhone11,6": return "iPhone XS Max"
        case "iPhone11,8": return "iPhone XR"

        // iPad
        case "iPad1,1": return "iPad"
        case "iPad2,1",
             "iPad2,2",
             "iPad2,3",
             "iPad2,4": return "iPad 2"
        case "iPad3,1",
             "iPad3,2",
             "iPad3,3": return "iPad 3"
        case "iPad3,4",
             "iPad3,5",
             "iPad3,6": return "iPad 4"
        case "iPad6,11",
             "iPad6,12": return "iPad 5"
        case "iPad7,5",
             "iPad7,6": return "iPad 6"

        // iPad Air
        case "iPad4,1",
             "iPad4,2",
             "iPad4,3": return "iPad Air"
        case "iPad5,3",
             "iPad5,4": return "iPad Air 2"
        case "iPad11,3",
             "iPad11,4": return "iPad Air 3"

        // iPad Mini
        case "iPad2,5",
             "iPad2,6",
             "iPad2,7": return "iPad Mini"
        case "iPad4,4",
             "iPad4,5",
             "iPad4,6": return "iPad Mini 2"
        case "iPad4,7",
             "iPad4,8",
             "iPad4,9": return "iPad Mini 3"
        case "iPad5,1",
             "iPad5,2": return "iPad Mini 4"
        case "iPad11,1",
             "iPad11,2": return "iPad Mini 5"

        // iPad Pro
        case "iPad6,3",
             "iPad6,4": return "iPad Pro (9.7-inch)"
        case "iPad6,7",
             "iPad6,8": return "iPad Pro (12.9-inch)"
        case "iPad7,1",
             "iPad7,2": return "iPad Pro (12.9-inch) G2"
        case "iPad7,3",
             "iPad7,4": return "iPad Pro (10.5-inch)"
        case "iPad8,1",
             "iPad8,2",
             "iPad8,3",
             "iPad8,4": return "iPad Pro (11-inch)"
        case "iPad8,5",
             "iPad8,6",
             "iPad8,7",
             "iPad8,8": return "iPad Pro (12.9-inch) G3"

        // Apple Watch
        case "Watch1,1",
             "Watch1,2": return "Apple Watch 1"
        case "Watch2,6",
             "Watch2,7": return "Apple Watch Series 1"
        case "Watch2,3",
             "Watch2,4": return "Apple Watch Series 2"
        case "Watch3,1",
             "Watch3,2",
             "Watch3,3",
             "Watch3,4": return "Apple Watch Series 3"
        case "Watch4,1",
             "Watch4,2",
             "Watch4,3",
             "Watch4,4": return "Apple Watch Series 4"

        // Apple TV
        case "AppleTV1,1": return "Apple TV"
        case "AppleTV2,1": return "Apple TV 2"
        case "AppleTV3,1",
             "AppleTV3,2": return "Apple TV 3"
        case "AppleTV5,3": return "Apple TV 4"
        case "AppleTV6,2": return "Apple TV 4K"

        // AirPods
        case "AirPods1,1": return "AirPods 1"
        case "AirPods2,1": return "AirPods 2"

        // HomePod
        case "AudioAccessory1,1",
             "AudioAccessory1,2": return "HomePod"

        // 模拟器
        case "i386",
             "x86_64": return "Simulator"

        default: return nil
        }
    }

}
