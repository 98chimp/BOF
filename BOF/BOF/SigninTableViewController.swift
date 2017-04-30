//
//  SigninTableViewController.swift
//  BOF
//
//  Created by Shahin on 2017-04-30.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import UIKit

class SigninTableViewController: BaseTableViewController
{
    fileprivate typealias singinTextField = Constants.BOFTextField
    fileprivate typealias segues = Constants.Identifiers.Segues
    
    // MARK: - Outlets
    @IBOutlet weak var emailTextField: BofTextField!
    @IBOutlet weak var passwordTextField: BofTextField!
    @IBOutlet weak var forgotButton: BofButton!
    
    // MARK: - Properties
    let user = User.currentUser
    var isSignupCompleted = false
    
    // MARK: - Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        handleSignupSuccess()
    }
    
    // MARK: - Helpers
    fileprivate func setupUI()
    {
        tableView.allowsSelection = false
        
        emailTextField.iconText = singinTextField.emailIcon
        passwordTextField.iconText = singinTextField.passwordIcon
        passwordTextField.iconFont = UIFont(name: singinTextField.iconFont, size: 17)
        passwordTextField.iconMarginBottom = 0.0
    }
    
    func isEmailFieldValid() -> Bool
    {
        return emailTextField.text?.tc_isValidEmailAddressFormat() ?? false
    }
    
    
    func isPasswordFieldValid() -> Bool
    {
        return passwordTextField.text?.characters.count ?? 0 >= kMinimumPasswordLength-1
    }
    
    func evaluate(_ textField: UITextField)
    {
        if textField === emailTextField
        {
            if let floatingTextField = textField as? BofTextField
            {
                floatingTextField.errorMessage = isEmailFieldValid() ? "" : "invalid email"
            }
        }
        else if textField === passwordTextField
        {
            if let floatingTextField = textField as? BofTextField
            {
                floatingTextField.errorMessage = isPasswordFieldValid() ? "" : "invalid password"
            }
        }
    }
    
    fileprivate func handleSignin()
    {
        if let email = emailTextField.text, let password = passwordTextField.text, isEmailFieldValid() && isPasswordFieldValid()
        {
            user.email = email
            user.password = password
            performSegue(withIdentifier: segues.toMainStoryboard, sender: self)
        }
        else
        {
            if !isEmailFieldValid()
            {
                emailTextField.shake()
            }
            
            if !isPasswordFieldValid()
            {
                passwordTextField.shake()
            }
        }
    }
    
    fileprivate func handleSignupSuccess()
    {
        if isSignupCompleted
        {
            emailTextField.text = user.email
            passwordTextField.text = user.password
            
            hud?.show(true)
            execute(after: 2.0) {
                self.presentHUDSuccess()
                execute(after: 1.0) {
                    self.hud?.dismiss(true)
                    self.performSegue(withIdentifier: segues.toMainStoryboard, sender: nil)
                }
            }
        }
    }
    
    // MARK: - TableView Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        switch indexPath.row {
        case 0:
            return view.bounds.height * 0.60
        case 3:
            return 90.0
        default :
            return 50.0
        }
    }
    
    // MARK: - TextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        evaluate(textField)
        
        if textField === emailTextField
        {
            _ = passwordTextField.becomeFirstResponder()
        }
        else if textField === passwordTextField
        {
            textField.resignFirstResponder()
            handleSignin()
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        evaluate(textField)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        forgotButton.isHidden = textField === passwordTextField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        forgotButton.isHidden = false
        evaluate(textField)
    }
    
    // MARK: - Actions
    @IBAction func signinButtonTapped(_ sender: UIButton)
    {
        handleSignin()
    }
    
    @IBAction func unwindFromSignup(_ segue: UIStoryboardSegue)
    {
        isSignupCompleted = true
    }
}
