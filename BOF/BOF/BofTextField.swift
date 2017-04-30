//
//  BofTextField.swift
//  BOF
//
//  Created by Shahin on 2017-04-30.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class BofTextField: SkyFloatingLabelTextFieldWithIcon
{
    fileprivate typealias textField = Constants.BOFTextField
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        iconFont = UIFont(name: textField.iconFont, size: 15)
        iconMarginBottom = 2.0
        iconColor = .white
        selectedIconColor = .bofYellow
        placeholderColor = .white
        lineColor = .white
        selectedLineColor = .bofYellow
        errorColor = .bofRed
        textColor = .white
        selectedTitleColor = .bofYellow
        titleColor = .white
    }
}
