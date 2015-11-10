//
//  main.swift
//  HashTableDemo
//
//  Created by Ketul Patel on 6/8/15.
//  Copyright (c) 2015 Ketul Patel. All rights reserved.
//
//this is main
import Foundation
var table = HashTable<String, String>()
table.setKey("Hello", withValue: "Hi")
table.setKey("Jay", withValue: "Awesome")
table.setKey("Michael", withValue: "Sensei")
table.setKey("Jimmy", withValue: "Ninja")

print(table.getValueAtKey("Hello"))
print(table.getValueAtKey("Jay"))
print(table.getValueAtKey("Michael"))
print(table.getValueAtKey("Jimmy"))
