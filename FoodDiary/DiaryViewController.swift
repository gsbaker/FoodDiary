//
//  ViewController.swift
//  FoodDiary
//
//  Created by George Baker on 25/04/2021.
//

import UIKit

class DiaryViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!

    var entry: Entry!
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if let savedUser = loadUser() {
            User.sharedInstance = savedUser
            user = User.sharedInstance
            if let latestEntry = user.entries.last {
                let currentDate = Date()
                let latestDate = latestEntry.date
                let dateFormatter = DateFormatter()
                dateFormatter.timeStyle = DateFormatter.Style.none
                dateFormatter.dateStyle = DateFormatter.Style.short
                if dateFormatter.string(from: currentDate) != dateFormatter.string(from: latestDate) {
                    let newEntry = Entry()
                    user.addEntry(entry: newEntry)
                }
            } else {
                let newEntry = Entry()
                user.addEntry(entry: newEntry)
            }
        } else {
            user = User.sharedInstance
            let newEntry = Entry()
            user.addEntry(entry: newEntry)
        }
        
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // return the number of rows for the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return user.entries[user.entries.count - 1].foods.count
        }
        
        return 0
    }
    
    // provide a cell object for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "diaryFoodCell", for: indexPath) as! FoodTableViewCell
        let food = user.entries[user.entries.count - 1].foods[indexPath.row]
        cell.update(with: food)
        return cell
    }
    
    @IBAction func composeButtonHandler() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let composeVC = storyboard.instantiateViewController(identifier: "ComposeViewController")
        
        show(composeVC, sender: self)
    }
    
    func saveUser() throws {
        let encoder = JSONEncoder()
        let jsonData = try encoder.encode(user)
        let jsonString = String(data: jsonData, encoding: String.Encoding.utf8)
        
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let pathWithFilename = documentDirectory.appendingPathComponent("users.json")
            
            do {
                try jsonString?.write(to: pathWithFilename, atomically: true, encoding: .utf8)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func loadUser() -> User? {
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let pathWithFilename = documentDirectory.appendingPathComponent("users.json")
            if let data = try? Data(contentsOf: pathWithFilename) {
                let jsonDecoder = JSONDecoder()
                if let jsonUser = try? jsonDecoder.decode(User.self, from: data) {
                    return jsonUser
                }
            }
        }
        
        return nil
    }
}
