//
// URL+Components.swift
// 
//
// Create by wooseng with company's MackBook Pro on 2019/9/16.
// 
//


import Foundation

public extension URL {
    
    /// 获取 URL 中的参数，即问号后面的参数
    var queryComponents: [String: String]? {
        let query = queryArray?.map { $0.urlKeyValue }.filter { $0 != nil }.map { $0! }
        guard let arr = query else {
            return nil
        }
        return Dictionary(uniqueKeysWithValues: arr)
    }
    
    private var queryArray: [String]? {
        return query?.split(separator: "&").map { String($0) }
    }
    
}

fileprivate extension String {
    
    var urlKeyValue: (key: String, value: String)? {
        let arr = split(separator: "=").map { String($0) }
        guard arr.count > 1 else {
            return nil
        }
        return (arr[0], arr[1])
    }
}
