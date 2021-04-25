//
//  ComposeViewController.swift
//  FoodDiary
//
//  Created by George Baker on 25/04/2021.
//

import UIKit

class ComposeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func cancelButtonHandler() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonHandler() {
        //TODO: handle done
        dismiss(animated: true, completion: nil)
    }

}
