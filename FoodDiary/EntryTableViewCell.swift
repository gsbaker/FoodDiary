//
//  EntryTableViewCell.swift
//  FoodDiary
//
//  Created by George Baker on 14/05/2021.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var caloriesLabel: UILabel!
    private var dateFormatter = DateFormatter()
    
    func update(with entry: Entry) {
        dateLabel.text = dateFormatter.string(from: entry.date)
        caloriesLabel.text = String(entry.getTotalCalories())
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        dateFormatter.dateStyle = .short
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
