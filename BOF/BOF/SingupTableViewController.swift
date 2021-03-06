//
//  SingupTableViewController.swift
//  BOF
//
//  Created by Shahin on 2017-04-30.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import UIKit
import RMDateSelectionViewController

class SignupTableViewController: BaseTableViewController
{
    fileprivate typealias bofTextField = Constants.BOFTextField
    
    // MARK: - Properties
    weak var delegate: SignupSuccessProtocol?
    
    // MARK: - Outlets
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var firstnameTextField: BofTextField!
    @IBOutlet weak var lastnameTextField: BofTextField!
    @IBOutlet weak var emailTextField: BofTextField!
    @IBOutlet weak var passwordTextField: BofTextField!
    @IBOutlet weak var passwordConfirmTextField: BofTextField!
    @IBOutlet weak var birthDateTextField: BofTextField!
    
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
        
        firstnameTextField.iconText = bofTextField.person
        lastnameTextField.iconText = bofTextField.person
        emailTextField.iconText = bofTextField.emailIcon
        passwordTextField.iconText = bofTextField.passwordIcon
        passwordTextField.iconFont = UIFont(name: bofTextField.iconFont, size: 17)
        passwordTextField.iconMarginBottom = 0.0
        passwordConfirmTextField.iconText = bofTextField.passwordIcon
        passwordConfirmTextField.iconFont = UIFont(name: bofTextField.iconFont, size: 17)
        passwordConfirmTextField.iconMarginBottom = 0.0
        birthDateTextField.iconText = bofTextField.calendar
    }
    
    func handleBirthDateTap()
    {
        view.endEditing(true)
        
        let selectAction = RMAction<UIDatePicker>(title: "Select", style: RMActionStyle.done) { controller in
            print("Successfully selected date: ", controller.contentView.date);
            self.datePickerPickedDate(controller.contentView.date)
        }
        
        let cancelAction = RMAction<UIDatePicker>(title: "Cancel", style: RMActionStyle.cancel) { _ in
            print("Date selection was canceled")
        }
        
        let birthDatePickerController = RMDateSelectionViewController(style: .black, title: "Pick Your Birth Date", message: "", select: selectAction, andCancel: cancelAction)!;
        birthDatePickerController.datePicker.datePickerMode = .date
        present(birthDatePickerController, animated: true, completion: nil)
    }
    
    func datePickerPickedDate(_ date: Date!)
    {
        user.birthDate = date;
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        birthDateTextField.text = dateFormatter.string(from: user.birthDate)
        view.endEditing(true)
    }
    
    func isFirstNameValid() -> Bool
    {
        return firstnameTextField.text?.characters.count ?? 0 >= 1
    }
    
    func isLastNameValid() -> Bool
    {
        return lastnameTextField.text?.characters.count ?? 0 >= 1
    }
    
    func isEmailFieldValid() -> Bool
    {
        return emailTextField.text?.tc_isValidEmailAddressFormat() ?? false
    }
    
    
    func isPasswordFieldValid() -> Bool
    {
        return passwordTextField.text?.characters.count ?? 0 >= kMinimumPasswordLength
    }
    
    func isPasswordConfirmFieldValid() -> Bool
    {
        return passwordConfirmTextField.text == passwordTextField.text
    }
    
    func isBirthdateValid() -> Bool
    {
        return birthDateTextField.text?.characters.count ?? 0 >= 1
    }
    
    // MARK: - TableView Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        switch indexPath.row {
        case 0:
            return view.bounds.height * 0.35
        case 7:
            return 90.0
        default :
            return 50.0
        }
    }
    
    // MARK: - TextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        switch textField {
        case firstnameTextField:
            _ = lastnameTextField.becomeFirstResponder()
            break
        case lastnameTextField:
            _ = emailTextField.becomeFirstResponder()
            break
        case emailTextField:
            _ = passwordTextField.becomeFirstResponder()
            break
        case passwordTextField:
            _ = passwordConfirmTextField.becomeFirstResponder()
            break
        default:
            textField.resignFirstResponder()
            handleBirthDateTap()
            return false
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        return true
    }
    
    // MARK: - Actions
    @IBAction func cancelButtonTapped(_ sender: UIButton)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signupButtonTapped(_ sender: UIButton)
    {
        if isFirstNameValid() && isLastNameValid() && isEmailFieldValid() && isPasswordFieldValid() && isPasswordConfirmFieldValid() && isBirthdateValid()
        {
            user.firstName = firstnameTextField.text!
            user.lastName = lastnameTextField.text!
            user.email = emailTextField.text!
            user.password = passwordTextField.text!
            
            delegate?.handleSignupSucess()

            dismiss(animated: true, completion: nil)
        }
        else
        {
            if !isFirstNameValid()
            {
                firstnameTextField.shake()
            }
            
            if !isLastNameValid()
            {
                lastnameTextField.shake()
            }
            
            if !isEmailFieldValid()
            {
                emailTextField.shake()
            }
            
            if !isPasswordFieldValid()
            {
                passwordTextField.shake()
            }
            
            if !isPasswordConfirmFieldValid() || passwordConfirmTextField.text == ""
            {
                passwordConfirmTextField.shake()
            }
            
            if !isBirthdateValid()
            {
                birthDateTextField.shake()
            }
        }
        
    }
    
    @IBAction func textFieldEditingDidChange(_ textField: BofTextField)
    {
        
        switch textField {
        case firstnameTextField:
            firstnameTextField.errorMessage = isFirstNameValid() ? "" : bofTextField.firstNameErrorMessage
            break
        case lastnameTextField:
            lastnameTextField.errorMessage = isLastNameValid() ? "" : bofTextField.lastNameErrorMessage
            break
        case emailTextField:
            emailTextField.errorMessage = isEmailFieldValid() ? "" : bofTextField.emailErrorMessage
            break
        case passwordTextField:
            passwordTextField.errorMessage = isPasswordFieldValid() ? "" : bofTextField.passwordErrorMessage
            break
        case passwordConfirmTextField:
            passwordConfirmTextField.errorMessage = isPasswordConfirmFieldValid() ? "" : bofTextField.confirmPasswordErrorMessage
            break
        default:
            _ = textField.resignFirstResponder()
            handleBirthDateTap()
            break
        }
    }
    
    @IBAction func birthDateHiddenButtonWasTapped(_ sender: UIButton)
    {
        handleBirthDateTap()
    }
}
