//
// UIApplication+Ext.swift
// Extension
//
// Create by wooseng with company's MackBook Pro on 2019/9/17.
// Copyright © 2019 残无殇. All rights reserved.
//


import UIKit

public extension UIApplication {
    
    /// 打开一个字符串链接
    ///
    /// 会根据系统版本自动调用不同的系统方法，并通过闭包的方式回调结果
    func open(_ urlString: String?,
              options: [UIApplication.OpenExternalURLOptionsKey: Any] = [:],
              completionHandler: ((Bool) -> Void)? = nil) {
        guard let urlString = urlString,
            let url = URL(string: urlString),
            canOpenURL(url) else {
                completionHandler?(false)
                return
        }
        if #available(iOS 10, *) {
            open(url, options: options, completionHandler: completionHandler)
        } else {
            let result = openURL(url)
            completionHandler?(result)
        }
    }
    
    /// 打开系统设置页面
    func openSystemSettings(_ options: [UIApplication.OpenExternalURLOptionsKey: Any] = [:],
                            _ completionHandler: ((Bool) -> Void)? = nil) {
        open(UIApplication.openSettingsURLString, options: options, completionHandler: completionHandler)
    }
    
    /// 拨打传入的电话号码，只需要传入电话号码
    func call(_ phone: String?,
              _ options: [UIApplication.OpenExternalURLOptionsKey: Any] = [:],
              _ completionHandler: ((Bool) -> Void)? = nil) {
        guard let phone = phone else {
            completionHandler?(false)
            return
        }
        open("tel://\(phone)", options: options, completionHandler: completionHandler)
    }
    
    /// 打开APP在App Store中的页面
    func itunes(_ id: String,
                _ mt: Int = 8,
                _ options: [UIApplication.OpenExternalURLOptionsKey: Any] = [:],
                _ completionHandler: ((Bool) -> Void)? = nil) {
        open("https://itunes.apple.com/app/id\(id)?mt=\(mt)", options: options, completionHandler: completionHandler)
    }
    
}
