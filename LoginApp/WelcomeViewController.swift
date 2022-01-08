//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Leysan Latypova on 08.01.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - Input
    var userName: String?
    
    @IBOutlet private var welcomeLabel: UILabel!
    
    // MARK: - View controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        if let userName = userName {
            welcomeLabel.text = "Welcome, \(userName)!"
        }
    }
}
