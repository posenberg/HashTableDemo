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
    //takes the key value interger and return the Node
    func findNodeWithKey(key: H) -> SinglyNode<H, T>? {
        //check if the Link list exist
        if var currentNode = head.next {
            //traverse through the list and check if the key exists
            while currentNode.key != key {
                if let nextNode = currentNode.next {
                    currentNode = nextNode
                } else {
                   // return nil if we are at the end of the list
                   return nil
                }
            }
            //return the current node
            return currentNode
        } else {
            //return nil is there is no match found
            return nil
        }
    }
    //key is Hashable and val is the generic type T the user can pass the value
    //returns an Node
    func upsertNodeWithKey(key: H, AndValue val: T) -> SinglyNode<H, T> {
        //check if the link list exist
        if var currentNode = head.next {
            //traverse to the end of the node to the last node
            //also check if the key already exist
            while currentNode.key != key {
                if let nextNode = currentNode.next {
                    currentNode = nextNode
                } else {
                    break;
                }
            }
            //if key already exists replace the node with the value and return the node
            if currentNode.key == key {
                currentNode.value = val
                return currentNode
            } else {
                //create a new node at the end of the list with the current(last node).next pointing to the new node
                currentNode.next = SinglyNode<H, T>(key: key, value: val, nextNode: nil)
                //return the new node force unwrap the newnode
                return currentNode.next!
            }
        } else {
            //if head.next is nil then create a new node to head.next
            head.next = SinglyNode<H, T>(key: key, value: val, nextNode: nil)
            //return the new node force unwrap the newnode
            return head.next!
        }
    }
}