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
    static func presentDisabledFeatureAlert() -> UIAlertController
    {
        let alert = UIAlertController(title: "Woops!", message: "This feature has not yet been implemented.\nPleae try again later.", preferredStyle: .alert)
        alert.view.tintColor = .bofOrange

        return alert
    }
}
