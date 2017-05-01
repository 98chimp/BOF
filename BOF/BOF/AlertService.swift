//
//  AlertService.swift
//  BOF
//
//  Created by Shahin on 2017-04-30.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import UIKit

class AlertService
{
    static func prepareDisabledFeatureAlert() -> UIAlertController
    {
        let alert = UIAlertController(title: "Woops!", message: "This feature has not yet been implemented.\nPleae try again later.", preferredStyle: .alert)
        alert.view.tintColor = .bofOrange

        return alert
    }
    
    static func prepareSuccessfulSignupAlert() -> UIAlertController
    {
        let alert = UIAlertController(title: "Oh Yeah!", message: "You have successfully signed up and are ready for sing in. Your email and password have been filled in for you from the previous screen.\nPlease proceed by tapping on the 'Sign in' button.", preferredStyle: .alert)
        alert.addAction(withTitle: "Okay", style: .default, handler: nil)
        alert.view.tintColor = .bofOrange

        return alert
    }
    
    static func prepareSignupRequestAlert() -> UIAlertController
    {
        let alert = UIAlertController(title: "Pssst!", message: "We don't have your credentials on record.\nYou'll need to sign up before you can proceed.\nTap 'Okay', and we'll take you there!", preferredStyle: .alert)
        alert.view.tintColor = .bofOrange
        
        return alert
    }
}
