//
//  FoodTableViewCell.swift
//  FoodDiary
//
//  Created by George Baker on 25/04/2021.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var caloriesLabel: UILabel!
    
    func update(with food: Food) {
        nameLabel.text = food.name
        caloriesLabel.text = String(food.calories)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
