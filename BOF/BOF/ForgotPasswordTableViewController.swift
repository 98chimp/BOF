//
//  ForgotPasswordTableViewController.swift
//  BOF
//
//  Created by Shahin on 2017-04-30.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import UIKit

class ForgotPasswordTableViewController: BaseTableViewController
{
    fileprivate typealias singinTextField = Constants.BOFTextField
    
    // MARK: - Outlets
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var emailTextField: BofTextField!
    
    // MARK: - Properties
    let user = User.currentUser
    
    // MARK: - Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Helpers
    fileprivate func setupUI()
    {
        tableView.allowsSelection = false
        emailTextField.iconText = singinTextField.emailIcon
    }
    
    func isEmailFieldValid() -> Bool
    {
        return emailTextField.text?.tc_isValidEmailAddressFormat() ?? false
    }
    
    fileprivate func handleSubmit()
    {
        if isEmailFieldValid()
        {
            let alert = AlertService.presentDisabledFeatureAlert()
            alert.addAction(withTitle: "Got it!", style: .cancel, handler: { 
                self.dismiss(animated: true, completion: nil)
            })
            present(alert, animated: true, completion: nil)
        }
        else
        {
            emailTextField.shake()
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
        textField.resignFirstResponder()
        handleSubmit()
        return true
    }
    
    // MARK: - Actions
    @IBAction func textFieldEditingChanged(_ textField: BofTextField)
    {
        textField.errorMessage = isEmailFieldValid() ? "" : "invalid email"
    }
    
    @IBAction func cancelButtonWasTapped(_ sender: UIButton)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func submitButtonWasTapped(_ sender: UIButton)
    {
        handleSubmit()
    }
}
