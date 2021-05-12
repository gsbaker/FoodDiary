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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let savedEntry = loadEntry() {
            entry = savedEntry
        } else {
            entry = Entry()
        }
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // return the number of rows for the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return entry.foods.count
        }
        
        return 0
    }
    
    // provide a cell object for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "diaryFoodCell", for: indexPath) as! FoodTableViewCell
        let food = entry.foods[indexPath.row]
        cell.update(with: food)
        return cell
    }
    
    @IBAction func composeButtonHandler() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let composeVC = storyboard.instantiateViewController(identifier: "ComposeViewController")
        
        show(composeVC, sender: self)
    }
    
    func saveEntry() throws {
        let encoder = JSONEncoder()
        let jsonData = try encoder.encode(entry)
        let jsonString = String(data: jsonData, encoding: String.Encoding.utf16)
        
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let pathWithFilename = documentDirectory.appendingPathComponent("entries.json")
            
            do {
                try jsonString?.write(to: pathWithFilename, atomically: true, encoding: .utf16)
            } catch {
                // TODO: handle this error properly
                print("Something went wrong in saveEntry()")
            }
        }
    }
    
    func loadEntry() -> Entry? {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        
        if let pathComponent = url.appendingPathComponent("entries.json") {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            
            if fileManager.fileExists(atPath: filePath) {
                print("File exists")
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: filePath), options: .alwaysMapped)
                    let jsonDecoder = JSONDecoder()
                    return try jsonDecoder.decode(Entry.self, from: data)
                } catch let error {
                    print(error.localizedDescription)
                }
            } else {
                print("File doesn't exist")
            }
        } else {
            print("File path not available")
        }
        
        return nil
    }
}
