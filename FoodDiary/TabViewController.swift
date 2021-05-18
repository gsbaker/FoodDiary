//
//  TabViewController.swift
//  FoodDiary
//
//  Created by George Baker on 14/05/2021.
//

import UIKit

class TabViewController: UITabBarController {
    
    var user: User!
    public var name = "George"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = User()

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

}
