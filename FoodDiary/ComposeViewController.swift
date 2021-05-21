//
//  ComposeViewController.swift
//  FoodDiary
//
//  Created by George Baker on 25/04/2021.
//

import UIKit

class ComposeViewController: UIViewController {
    
    @IBOutlet var doneBarButton: UIBarButtonItem!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var caloriesTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        doneBarButton.isEnabled = false
        [nameTextField, caloriesTextField].forEach({
            $0?.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        })
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        
        guard
            let name = nameTextField.text, !name.isEmpty,
            let calories = caloriesTextField.text, !calories.isEmpty
        
        else {
            doneBarButton.isEnabled = false
            return
        }
        doneBarButton.isEnabled = true
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
            if let diaryVC = tabVC.viewControllers?[0] as? DiaryViewController,
               let historyVC = tabVC.viewControllers?[1] as? HistoryViewController {
                let user = User.sharedInstance
                
                var currentEntry: Entry {
                    get {
                        return user.entries[user.entries.count - 1]
                    }
                    set {
                        user.entries[user.entries.count - 1] = newValue
                    }
                }
                
                currentEntry.add(food: food)
                diaryVC.tableView.reloadData()
                historyVC.tableView.reloadData()
                do {
                    try diaryVC.saveUser()
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
        
        dismiss(animated: true, completion: nil)
    }
}
