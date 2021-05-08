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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        foods = try container.decode([Food].self, forKey: .foods)
        date = try container.decode(Date.self, forKey: .date)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(foods, forKey: .foods)
        try container.encode(date, forKey: .date)
    }
    
    mutating func add(food: Food) {
        foods.append(food)
    }
    
    enum CodingKeys: String, CodingKey {
        case foods, date
    }
}
