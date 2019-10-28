//
// String+Crypto.swift
// Footstone
//
// Create by wooseng with company's MackBook Pro on 2019/10/23.
// Copyright © 2019 上海稍息网络科技有限公司. All rights reserved.
//


import Foundation
import CommonCrypto

//MARK: - MD5
public extension String {
    
    var md5: String {
        guard let data = data(using: .utf8) else {
            return self
        }
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        
        #if swift(>=5.0)
        _ = data.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) in
            return CC_MD5(bytes.baseAddress, CC_LONG(data.count), &digest)
        }
        #else
        _ = data.withUnsafeBytes { bytes in
            return CC_MD5(bytes, CC_LONG(data.count), &digest)
        }
        #endif
        
        return digest.reduce(into: "") { $0 += String(format: "%02x", $1) }
    }
    
}



//MARK: - Base64
public extension String {
    
    /// 对字符串进行 base64 加密，加密失败返回 nil
    func base64EncodeString(options: Data.Base64EncodingOptions = []) -> String? {
        guard let data = data(using: .utf8) else {
            return nil
        }
        return data.base64EncodedString(options: options)
    }
    
    /// 对使用 base64 加密的字符串进行解密，解密失败返回 nil
    func base64DecodedString(options: Data.Base64DecodingOptions = []) -> String? {
        guard let data = Data(base64Encoded: self, options: options) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    
}

//mark: - URLEncode & URLDecode
public extension String {
    
    // 对 URL 通过添加百分号的方式进行编码
    var URLEncode: String {
        var allowedCharacterSet = CharacterSet.urlQueryAllowed
        allowedCharacterSet.remove(charactersIn: ":#[]@")
        allowedCharacterSet.remove(charactersIn: "!$&'()*+,;=")
        return addingPercentEncoding(withAllowedCharacters: allowedCharacterSet) ?? self
    }
    
    // 移除 URL 中的百分号编码
    var URLDecode: String {
        return removingPercentEncoding ?? self
    }
    
}
