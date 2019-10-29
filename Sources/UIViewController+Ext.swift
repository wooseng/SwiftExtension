//
// UIViewController+Ext.swift
// Sources
//
// Create by wooseng with company's MackBook Pro on 2019/10/29.
// Copyright © 2019 残无殇. All rights reserved.
//


import UIKit

public extension UIViewController {
    
    /// 使用导航栏推出一个页面，并在推出的时候隐藏底部 Tabbar
    func push(_ closure: @autoclosure () -> UIViewController?, animated: Bool) {
        guard let vc = closure() else {
            return
        }
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: animated)
    }
    
}
