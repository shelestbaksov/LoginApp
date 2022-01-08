//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Leysan Latypova on 08.01.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    @IBOutlet var welcomeLabel: UILabel!
    
    var welcomeTextLabel: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        welcomeLabel.text = welcomeTextLabel
    }
    

//    @IBAction func logOutButtonPressed() {
//        navigationController?.popViewController(animated: true)
//    }
    

}
