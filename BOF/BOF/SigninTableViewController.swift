//
//  SigninTableViewController.swift
//  BOF
//
//  Created by Shahin on 2017-04-30.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import UIKit

class SigninTableViewController: BaseTableViewController, SignupSuccessProtocol
{
    fileprivate typealias bofTextField = Constants.BOFTextField
    fileprivate typealias segues = Constants.Identifiers.Segues
    
    // MARK: - Outlets
    @IBOutlet weak var emailTextField: BofTextField!
    @IBOutlet weak var passwordTextField: BofTextField!
    @IBOutlet weak var forgotButton: BofButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)
        clearTextFields()
    }
    
    // MARK: - Helpers
    fileprivate func setupUI()
    {
        tableView.allowsSelection = false
        
        emailTextField.iconText = bofTextField.emailIcon
        passwordTextField.iconText = bofTextField.passwordIcon
        passwordTextField.iconFont = UIFont(name: bofTextField.iconFont, size: 17)
        passwordTextField.iconMarginBottom = 0.0
    }
    
    func isEmailFieldValid() -> Bool
    {
        return emailTextField.text?.tc_isValidEmailAddressFormat() ?? false
    }
    
    func isPasswordFieldValid() -> Bool
    {
        return passwordTextField.text?.characters.count ?? 0 >= kMinimumPasswordLength
    }
    
    fileprivate func handleSignin()
    {
        if let email = emailTextField.text, let password = passwordTextField.text, isEmailFieldValid() && isPasswordFieldValid()
        {
            
            if (email, password, user.token) == SessionService.shared.retrieveCredentials()
            {
                user.email = email
                user.password = password
                SessionService.shared.signin(user)
                
                performSegue(withIdentifier: segues.toMainStoryboard, sender: user)
            }
            else
            {
                let alert = AlertService.prepareSignupRequestAlert()
                alert.addAction(withTitle: "Okay", style: .default, handler: {
                    self.performSegue(withIdentifier: segues.toSignupScreen, sender: self)
                })
                present(alert, animated: true, completion: nil)
            }
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
    
    fileprivate func clearTextFields()
    {
        emailTextField.text = ""
        passwordTextField.text = ""
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
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        forgotButton.isHidden = textField === passwordTextField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        forgotButton.isHidden = false
    }
    
    // MARK: - Actions
    @IBAction func textFieldEditingDidChange(_ textField: BofTextField)
    {
        switch textField {
        case emailTextField:
            textField.errorMessage = isEmailFieldValid() ? "" : bofTextField.emailErrorMessage
            break
        default:
            textField.errorMessage = isPasswordFieldValid() ? "" : bofTextField.passwordErrorMessage
            break
        }
    }
    
    @IBAction func signinButtonTapped(_ sender: UIButton)
    {
        handleSignin()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == segues.toSignupScreen
        {
            let destinationVC = segue.destination as? SignupTableViewController
            destinationVC?.delegate = self
        }
    }
    
    // MARK: - Protocols
    func handleSignupSucess()
    {
        user.token = UUID().uuidString
        
        execute(after: 1.0) {
            self.hud?.show(true)
            execute(after: 2.0) {
                self.presentHUDSuccess()
                self.emailTextField.text = self.user.email
                self.passwordTextField.text = self.user.password
                
                execute(after: 1.0) {
                    self.hud?.dismiss(true)
                    
                    SessionService.shared.storeCredentialsFor(self.user)
                    SessionService.shared.storeUserInfo(self.user.zipForLocalStorage())

                    self.present(AlertService.prepareSuccessfulSignupAlert() , animated: true, completion: nil)
                }
            }
        }
    }
}
