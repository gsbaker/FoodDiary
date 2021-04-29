//
//  Food.swift
//  FoodDiary
//
//  Created by George Baker on 25/04/2021.
//

import Foundation

struct Food {
    var name: String
    var calories: Int
    
    init(name: String, calories: Int) {
        self.name = name
        self.calories = calories
    }
}
