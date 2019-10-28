//
// UICollectionView+Ext.swift
// Extension
//
// Create by wooseng with company's MackBook Pro on 2019/9/17.
// Copyright © 2019 残无殇. All rights reserved.
//


import UIKit

public extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_ cls: T.Type) {
        register(cls, forCellWithReuseIdentifier: T.identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(_ cls: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
    
}

public extension UICollectionView {
    
    /// 是否可以滚动到指定 IndexPath
    func canScroll(to indexPath: IndexPath) -> Bool {
        guard indexPath.section < numberOfSections,
            indexPath.row < numberOfItems(inSection: indexPath.section) else {
                return false
        }
        return true
    }
    
}
