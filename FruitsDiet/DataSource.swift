//
//  DataSource.swift
//  FruitsDiet
//
//  Created by Ravi Shankar on 29/07/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import Foundation

class DataSource {
    
    init() {
        populateData()
    }
    
    var fruits:[Fruit] = []
    var groups:[String] = []
    
    
    func numbeOfRowsInEachGroup(index: Int) -> Int {
        return fruitsInGroup(index).count
    }
    
    func numberOfGroups() -> Int {
        return groups.count
    }
    
    func gettGroupLabelAtIndex(index: Int) -> String {
        return groups[index]
    }
    
    // MARK:- Populate Data from plist
    
    func populateData() {
        if let path = NSBundle.mainBundle().pathForResource("fruits", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let name = dict["name"] as! String
                        let group = dict["group"] as! String
                        
                        let fruit = Fruit(name: name, group: group)
                        if !groups.contains(group){
                            groups.append(group)
                        }
                        fruits.append(fruit)
                    }
                }
            }
        }
    }
    
    // MARK:- FruitsForEachGroup
    
    func fruitsInGroup(index: Int) -> [Fruit] {
        let item = groups[index]
        let filteredFruits = fruits.filter { (fruit: Fruit) -> Bool in
            return fruit.group == item
        }
        return filteredFruits
    }
    
    // MARK:- Add Dummy Data
    
    func addAndGetIndexForNewItem() -> Int {
        
        let fruit = Fruit(name: "SugarApple", group: "Morning")
        
        let count = fruitsInGroup(0).count
        
        let index = count > 0 ? count - 1 : count
        fruits.insert(fruit, atIndex: index)
        
        return index
    }
    
    // MARK:- Delete Items
    
    func deleteItems(items: [Fruit]) {
        
        for item in items {
            // remove item
            let index = fruits.indexOfObject(item)
            if index != -1 {
                fruits.removeAtIndex(index)
            }
        }
    }
}

extension Array {
    func indexOfObject<T:AnyObject>(item:T) -> Int {
        var index = -1
        for element in self {
            index++
            if item === element as? T {
                return index
            }
        }
        return index
    }
}