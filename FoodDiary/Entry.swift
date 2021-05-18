//
//  Entry.swift
//  FoodDiary
//
//  Created by George Baker on 01/05/2021.
//

import Foundation

struct Entry: Codable {
    
    var foods: [Food]
    var date: Date
    
    init() {
        foods = []
        date = Date() // current date
    }
    
    mutating func add(food: Food) {
        foods.append(food)
    }
    
    func getTotalCalories() -> Int {
        if foods.count == 0 {
            return 0
        }
        
        var calories = 0
        
        for food in foods {
            calories += food.calories
        }
        
        return calories
    }
}
