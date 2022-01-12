//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Leysan Latypova on 08.01.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - Input
    var user: User!
    
    @IBOutlet private var welcomeLabel: UILabel!
    
    // MARK: - View controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        welcomeLabel.text = "Welcome, \(user.name) \(user.surname)!"
    }
}
