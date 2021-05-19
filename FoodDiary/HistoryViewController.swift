//
//  HistoryViewController.swift
//  FoodDiary
//
//  Created by George Baker on 14/05/2021.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        user = User.sharedInstance
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if let validEntries = user.getValidEntries() {
                return validEntries.count
            } else {
                return 0
            }
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyEntryCell", for: indexPath) as! EntryTableViewCell

        // configure the cell's contents
        if let validEntries = user.getValidEntries() {
            let entry = validEntries[indexPath.row]
            if entry.getTotalCalories() > 0 {
                cell.update(with: entry)
            }
        }
        
        return cell
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
