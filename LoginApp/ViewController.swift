//
//  ViewController.swift
//  LoginApp
//
//  Created by Leysan Latypova on 08.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    var welcomeLabel: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
    }
    
    
    
    @IBAction func logInButtonPressed() {
        guard let inputUserNameText = userNameTextField.text, !inputUserNameText.isEmpty, inputUserNameText == "User"
        else { showAlert(with: "Invalid user name or password", and: "Please enter your name and password")
            return
        }
        guard let inputPasswordText = passwordTextfield.text, !inputPasswordText.isEmpty, inputPasswordText == "1234"
        else { showAlert(with: "Invalid user name or password", and: "Please enter your name and password")
            return
        }
        
        if let _ = Double(inputUserNameText) {
            showAlert(with: "Invalid user name or password", and: "Please use enter yor name and password")
            return
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {return}
        welcomeVC.welcomeTextLabel = "Welcome, \(userNameTextField.text!)"
    }
    
    @IBAction func forgotUserNameButtonPressed() {
        showAlert(with: "User name is", and: "User")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(with: "Password is", and: "1234")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextfield.text = ""
    }
    
}

extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.userNameTextField.text = ""
            self.passwordTextfield.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
