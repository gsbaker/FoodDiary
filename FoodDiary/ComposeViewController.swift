//
//  ComposeViewController.swift
//  FoodDiary
//
//  Created by George Baker on 25/04/2021.
//

import UIKit

class ComposeViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var caloriesTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButtonHandler() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonHandler() {
        let name = nameTextField.text ?? ""
        let caloriesText = caloriesTextField.text ?? ""
        let calories = Int(caloriesText) ?? 0
        let food = Food(name: name, calories: calories)
        
        if let tabVC = presentingViewController as? UITabBarController {
            if let diaryVC = tabVC.viewControllers?[0] as? DiaryViewController {
                diaryVC.entry.add(food: food)
                diaryVC.tableView.reloadData()
                do {
                    try diaryVC.saveEntry()
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
        
        dismiss(animated: true, completion: nil)
    }
}
