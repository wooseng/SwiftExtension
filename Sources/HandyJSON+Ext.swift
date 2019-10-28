//
// HandyJSON+Ext.swift
// Footstone
//
// Create by wooseng with company's MackBook Pro on 2019/10/22.
// Copyright © 2019 上海稍息网络科技有限公司. All rights reserved.
//

#if canImport(HandyJSON)
import HandyJSON

public extension Array where Element: HandyJSON {
    
    static func deserializeValue(from json: String?, designatedPath: String? = nil) -> [Element]? {
        return deserialize(from: json, designatedPath: designatedPath)?.filter{ $0 != nil }.map { $0! }
    }
    
    static func deserializeValue(from array: NSArray?) -> [Element]? {
        return deserialize(from: array)?.filter{ $0 != nil }.map { $0! }
    }
    
    static func deserializeValue(from array: [Any]?) -> [Element]? {
        return deserialize(from: array)?.filter{ $0 != nil }.map { $0! }
    }
    
}

public extension HandyJSON {
    
    static func deserialize(from dict: Any?, designatedPath: String? = nil) -> Self? {
        if let val = dict as? [String: Any] {
            return deserialize(from: val, designatedPath: designatedPath)
        }
        if let val = dict as? NSDictionary {
            return deserialize(from: val, designatedPath: designatedPath)
        }
        if let val = dict as? String {
            return deserialize(from: val, designatedPath: designatedPath)
        }
        return nil
    }
    
}

public extension HandyJSON {
    
    // 生成一组测试数据
    static func generateTestDatas() -> [Self] {
        return []
    }
    
    // 生成单个测试数据
    static func generateTestData() -> Self {
        return Self.init()
    }
    
}

#endif
