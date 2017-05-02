//
//  NewPostViewController.swift
//  BOF
//
//  Created by Shahin on 2017-05-01.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import UIKit
import SZTextView

class NewPostViewController: UIViewController, UITextViewDelegate
{
    // MARK: - Outlets
    @IBOutlet weak var postTextView: SZTextView!
    @IBOutlet var accessoryView: UIView!
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var postButton: UIButton!
    
    // MARK: - Properties
    fileprivate let currentUser = User.current
    var delegate: NewPostProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        postTextView.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }
    
    // MARK: - Helpers
    fileprivate func configureView()
    {
    }
    
    // MARK: - TextView Delegate
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool
    {
        if textView.inputAccessoryView == nil
        {
            textView.inputAccessoryView = accessoryView
        }
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
    {
        let newLength = textView.text.characters.count + text.characters.count - range.length
        countdownLabel.text = "\(140 - newLength)"
        
        if newLength <= 140
        {
            postButton.isEnabled = true
            postButton.isHighlighted = true
        }
        else
        {
            postButton.isHighlighted = false
            postButton.isEnabled = false
        }
        return true
    }
    
    // MARK: - Actions
    @IBAction func cancelButtonWasTapped(_ sender: UIButton)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func postButtonWasTapped(_ sender: UIButton)
    {
        if postTextView.text == ""
        {
            postTextView.shake()
        }
        else
        {
            delegate?.handleNewPost()
            dismiss(animated: true, completion: nil)
        }
    }
}
