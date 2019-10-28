//
// Array+Value.swift
// Extension
//
// Create by wooseng with company's MackBook Pro on 2019/9/16.
// Copyright © 2019 残无殇. All rights reserved.
//


import Foundation

public extension Array {
    
    /// 从数组中取出指定下标的值，如果下标超出范围，则返回 nil
    func object(at idx: Int) -> Element? {
        guard idx >= 0, idx < count else {
            return nil
        }
        return self[idx]
    }
    
    /**
     获取一个元素，如果数组为空，就返回 nil, 否则返回一个具体的元素，即如果数组不为空，一定会返回一个元素。
     
     1. 如果下标为正数，则正循环取值
     比如数组个数为5，要取的下标为5，则返回第1个元素，要取的下标为6，则返回第2个元素，依次类推
     取到最后一个元素之后，再次从第一个元素开始取值
     2. 如果下标为负数，则负循环取值
     比如数组个数为5，要取的下标为-1，则返回最后一个元素，要取的下标为-2，则返回倒数第二个元素，依次类推
     取到第一个元素后，再从最后一个元素开始取值
     */
    func loopObject(at idx: Int) -> Element? {
        guard !isEmpty else {
            return nil
        }
        if idx > 0 {
            return self[idx % count]
        } else if idx < 0 {
            return self[(count + idx % count) % count]
        } else {
            return self[0]
        }
    }
    
    /**
     取数组中间的元素
     
     1. 如果数组为空，则返回空
     2. 如果数组个数为偶数，则取中间两个元素的第一个
     3. 如果数组个数为奇数，则取正中间的元素
     */
    func midObject() -> Element? {
        guard !isEmpty else {
            return nil
        }
        if count % 2 == 0 {
            return self[count / 2 - 1]
        } else {
            return self[count / 2]
        }
    }
    
}
