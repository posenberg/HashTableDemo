//
//  HashTable.swift
//  HashTableDemo
//
//  Created by Ketul Patel on 6/8/15.
//  Copyright (c) 2015 Ketul Patel. All rights reserved.
//

import Foundation



//struct - pass by value
//two generic values H is hashable not hashtable and T is the value stored
struct HashTable<H: Hashable, T> {
    //the linked list is optional generic type H, T
    //table =new Array()
    var table = Array<SinglyLinkedList<H, T>?>() // var can be declared anywhere
    
    init() {
        //the HashTable has an array of 10 lists
        for _ in 0...9 {
            //table[0]= new SinglyLinkedList()
            table.append(SinglyLinkedList<H, T>())
        }
    }
    //private function cannot be accessed outside of the hashtable
    //takes a key, which is Hashable returns an Integer
    private func hasher(key: H) -> Int {
        //The protocol Hashable gives a 19 digit signed value
        let inn = abs(key.hashValue) % 10
        print(inn)
        //4799450059375354168
        //4799450059692192894
        print(key.hashValue)
        return inn // the key which the absolute values last digit
    }
    // mutating is to change the variable table in the function
    mutating func setKey(key: H, withValue val: T) {
        // the private function hasher is called to set the table index
        let bucket = hasher(key)
        //upsertNodeWithKey get the key value and append the node to the singlylinklist of the key
        table[bucket]?.upsertNodeWithKey(key, AndValue: val)
    }
    //the key is passed and the noe value is obtained
    func getValueAtKey(key: H) -> T? {
        //get the hashable index
        let bucket = hasher(key)
        //get the singlylistlint from the tables index and return the node value if exist
        // the node value is returned without unwrapping so it is going to have Optional in it
        return table[bucket]?.findNodeWithKey(key)?.value
    }
}