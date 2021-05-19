//
//  User.swift
//  FoodDiary
//
//  Created by George Baker on 14/05/2021.
//

import Foundation

class User: Codable {
    
    var entries: [Entry]
    
    static var sharedInstance = User()
    
    init() {
        entries = []
    }
    
    func addEntry(entry: Entry) {
        entries.append(entry)
    }
    
    func getLatestEntry() -> Entry? {
        if entries.count == 0 {
            return nil
        }
        
        return entries.last
    }
    
    func getValidEntries() -> [Entry]? {
        var validEntries: [Entry] = []
        
        for entry in entries {
            if entry.getTotalCalories() > 0 {
                validEntries.append(entry)
            }
        }
        
        if validEntries.count == 0 {
            return nil
        }
        
        return validEntries
    }
}
