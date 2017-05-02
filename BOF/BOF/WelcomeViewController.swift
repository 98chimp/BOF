//
//  WelcomeViewController.swift
//  BOF
//
//  Created by Shahin on 2017-04-30.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController
{    
    // MARK: - Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    // MARK: - Actions
    @IBAction func skipButtonPressed(_ sender: UIButton)
    {
        dismiss(animated: true, completion: nil)
    }
}
