//
//  ViewController.swift
//  FoodDiary
//
//  Created by George Baker on 25/04/2021.
//

import UIKit

class DiaryViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var foods: [Food] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // return the number of rows for the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return foods.count
        }
        
        return 0
    }
    
    // provide a cell object for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "diaryFoodCell", for: indexPath) as! FoodTableViewCell
        let food = foods[indexPath.row]
        cell.update(with: food)
        return cell
    }
    
    
    @IBAction func composeButtonHandler() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let composeVC = storyboard.instantiateViewController(identifier: "ComposeViewController")
        
        show(composeVC, sender: self)
    }

}

