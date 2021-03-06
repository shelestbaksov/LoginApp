//
//  ViewController.swift
//  LoginApp
//
//  Created by Leysan Latypova on 08.01.2022.
//

import UIKit



class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private var userNameTextField: UITextField!
    @IBOutlet private var passwordTextfield: UITextField!
    
    private let user = User.getUserInfo()
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                let aboutMeVC = navigationVC.topViewController as! AboutMeViewController
                aboutMeVC.user = user
            }
        }
    }
    
    // MARK: - View controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupKeyboardHidingOnViewTap()
        userNameTextField.delegate = self
        passwordTextfield.delegate = self
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - User input
    @IBAction private func logInButtonPressed() {
        performChecksAndLoginIfNeeded()
    }
    
    @IBAction func forgotUserNameButtonPressed() {
        showAlert(title: "User name is", message: "User")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(title: "Password is", message: "1234")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        clearTextFields()
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTextField:
            self.passwordTextfield.becomeFirstResponder()
        case passwordTextfield:
            passwordTextfield.resignFirstResponder()
            performChecksAndLoginIfNeeded()
        default:
            assertionFailure("textFieldShouldReturn is called for unknown textfield")
        }
        return true
    }
    
    // MARK: - Private implementation
    private func performChecksAndLoginIfNeeded() {
        let clearTextFields: (UIAlertAction) -> () = { [weak self] _ in
            self?.clearTextFields()
        }
        
        guard
            let userName = userNameTextField.text,
            !userName.isEmpty
        else {
            showAlert(
                title: "Invalid user name or password",
                message: "Please enter your name and password",
                onOkTap: clearTextFields
            )
            return
        }
        guard
            let password = passwordTextfield.text,
            !password.isEmpty
        else {
            showAlert(
                title: "Invalid user name or password",
                message: "Please enter your name and password",
                onOkTap: clearTextFields
            )
            return
        }
        
        if let _ = Double(userName) {
            showAlert(
                title: "Invalid user name or password",
                message: "Please use enter yor name and password",
                onOkTap: clearTextFields
            )
            return
        }
        if userName == user.loginData.userName && password == user.loginData.password {
            performSegue(withIdentifier: "showDetail", sender: self)
        }
    }
       
    private func clearTextFields() {
        userNameTextField.text = ""
        passwordTextfield.text = ""
    }
}

extension LoginViewController {
    private func showAlert(
        title: String,
        message: String,
        onOkTap: ((UIAlertAction) -> ())? = nil)
    {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: onOkTap)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

fileprivate extension UIViewController {
    func setupKeyboardHidingOnViewTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
