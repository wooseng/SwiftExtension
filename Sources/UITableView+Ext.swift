//
// UITableView+Ext.swift
// Extension
//
// Create by wooseng with company's MackBook Pro on 2019/9/17.
// Copyright © 2019 残无殇. All rights reserved.
//


import UIKit

public extension UITableView {
    
    func register<T: UITableViewCell>(_ cls: T.Type) {
        register(cls, forCellReuseIdentifier: T.identifier)
    }
    
    func register<T: UITableViewHeaderFooterView>(_ cls: T.Type) {
        register(cls, forHeaderFooterViewReuseIdentifier: T.identifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ cls: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ cls: T.Type) -> T? {
        return dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as? T
    }
    
}

public extension UITableView {
    
    /// 是否可以滚动到指定 IndexPath
    func canScroll(to indexPath: IndexPath) -> Bool {
        guard indexPath.section < numberOfSections,
            indexPath.row < numberOfRows(inSection: indexPath.section) else {
                return false
        }
        return true
    }
    
}
