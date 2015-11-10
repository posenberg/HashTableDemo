//
//  HashTable.swift
//  HashTableDemo
//
//  Created by Ketul Patel on 6/8/15.
//  Copyright (c) 2015 Ketul Patel. All rights reserved.
//

import Foundation




struct HashTable<H: Hashable, T> {
    var table = Array<SinglyLinkedList<H, T>?>()
    init() {
        for _ in 0...9 {
            table.append(SinglyLinkedList<H, T>())
        }
    }
    private func hasher(key: H) -> Int {
        return abs(key.hashValue) % 10
    }
    mutating func setKey(key: H, withValue val: T) {
        let bucket = hasher(key)
        table[bucket]?.upsertNodeWithKey(key, AndValue: val)
    }
    func getValueAtKey(key: H) -> T? {
        let bucket = hasher(key)
        return table[bucket]?.findNodeWithKey(key)?.value
    }
}