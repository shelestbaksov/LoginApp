//
//  BonusViewController.swift
//  LoginApp
//
//  Created by Leysan Latypova on 12.01.2022.
//

import UIKit

class BonusViewController: UIViewController {
    
    // MARK: - Input
    var user: User!

    @IBOutlet var userImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        userImageView.image = UIImage(named: user.imageName)
    }
}
