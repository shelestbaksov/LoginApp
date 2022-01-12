//
//  AboutMeViewController.swift
//  LoginApp
//
//  Created by Leysan Latypova on 11.01.2022.
//

import UIKit

class AboutMeViewController: UIViewController {

    // MARK: - Input
    var user: User!
    
// Не забывай label слово
    @IBOutlet var hobbyTitleLabel: UILabel!
    @IBOutlet var hobbyDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hobbyTitleLabel.text = user.hobby.title
        hobbyDescriptionLabel.text = user.hobby.description

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bonusVC = segue.destination as? BonusViewController else { return }
        bonusVC.user = user
    }
}
