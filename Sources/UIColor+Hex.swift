//
// UIColor+Hex.swift
// Extension
//
// Create by wooseng with company's MackBook Pro on 2019/9/16.
// Copyright © 2019 残无殇. All rights reserved.
//


import UIKit

//MARK: - Hex
public extension UIColor {
    
    /// 使用十六进制初始化一个颜色, 如果失败，则初始化一个白色
    /// 可以同时设置暗黑模式下的颜色值
    /// 支持格式: "#F", "F", "#FFF", "FFF", "#FFFFFF", "FFFFFF"
    ///
    /// - Parameter any: 普通模式下的颜色值
    /// - Parameter dark: 暗黑模式下的颜色值，如果为空，则使用any
    convenience init(hex any: String, dark: String? = nil) {
        func rgbaCode(_ s: String) -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
            guard let intCode = Int(s, radix: 16) else {
                return (1, 1, 1, 0)
            }
            let r = CGFloat((intCode >> 16) & 0xFF) / 255.0
            let g = CGFloat((intCode >> 8) & 0xFF) / 255.0
            let b = CGFloat(intCode & 0xFF) / 255.0
            return (r, g, b, 1)
        }
        if #available(iOS 13.0, *) {
            let dark = dark ?? any
            self.init {
                let hex: String
                switch $0.userInterfaceStyle {
                case .dark: hex = dark.toColorHex()
                default: hex = any.toColorHex()
                }
                let rgba = rgbaCode(hex)
                return UIColor(red: rgba.r, green: rgba.g, blue: rgba.b, alpha: rgba.a)
            }
        } else {
            let hex = any.toColorHex()
            let rgba = rgbaCode(hex)
            self.init(red: rgba.r, green: rgba.g, blue: rgba.b, alpha: rgba.a)
        }
    }
    
    /// 使用十六进制初始化一个颜色, 如果失败，则初始化一个白色
    /// 可以同时设置是否自动计算暗黑模式下对应的颜色
    /// 支持格式: "#F", "F", "#FFF", "FFF", "#FFFFFF", "FFFFFF"
    ///
    /// - Parameter any: 普通模式下的颜色值
    /// - Parameter automatic: 是否自动计算暗黑模式下对应的颜色
    convenience init(hex any: String, automatic: Bool) {
        let hex = any.toColorHex()
        guard automatic else {
            self.init(hex: hex, dark: nil)
            return
        }
        let dark = hex.reverseColorHex()
        self.init(hex: hex, dark: dark)
    }
    
}

//MARK: - UIImage
public extension UIColor {
    
    /// 将颜色转为图片
    ///
    /// 注意：一旦将 rect 设置为 zero，将返回 nil
    func toImage(_ rect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)) -> UIImage? {
        UIGraphicsBeginImageContext(rect.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        context.setFillColor(cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}

// MARK: - Gradient
public extension Array where Element : UIColor {
    
    /// 将颜色数组转为渐变色
    ///
    /// 部分参数需要自己在闭包中设置
    func gradient(_ transform: ((_ gradient: inout CAGradientLayer) -> CAGradientLayer)? = nil) -> CAGradientLayer {
        var gradient = CAGradientLayer()
        gradient.colors = map { $0.cgColor }
        
        if let transform = transform {
            gradient = transform(&gradient)
        }
        return gradient
    }
}
