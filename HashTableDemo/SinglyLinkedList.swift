//
//  SinglyLinkedList.swift
//  HashTableDemo
//
//  Created by Ketul Patel on 6/8/15.
//  Copyright (c) 2015 Ketul Patel. All rights reserved.
//

import Foundation
class HeadNode<T> {
    var next: T?
}
class SinglyNode<H: Hashable, T> {
    var value: T
    var key: H
    var next: SinglyNode<H, T>?
    init(key: H, value: T, nextNode: SinglyNode<H, T>?) {
        self.next = nextNode
        self.key = key
        self.value = value
        print("Initialized new Node with key \(self.key) and value \(self.value)")
    }
}

struct SinglyLinkedList<H: Hashable, T> {
    var head = HeadNode<SinglyNode<H, T>>()
    func findNodeWithKey(key: H) -> SinglyNode<H, T>? {
        if var currentNode = head.next {
            while currentNode.key != key {
                if let nextNode = currentNode.next {
                    currentNode = nextNode
                } else {
                   return nil
                }
            }
            return currentNode
        } else {
            return nil
        }
    }
    func upsertNodeWithKey(key: H, AndValue val: T) -> SinglyNode<H, T> {
        if var currentNode = head.next {
            while currentNode.key != key {
                if let nextNode = currentNode.next {
                    currentNode = nextNode
                } else {
                    break;
                }
            }
            if currentNode.key == key {
                currentNode.value = val
                return currentNode
            } else {
                currentNode.next = SinglyNode<H, T>(key: key, value: val, nextNode: nil)
                return currentNode.next!
            }
        } else {
            head.next = SinglyNode<H, T>(key: key, value: val, nextNode: nil)
            return head.next!
        }
    }
}