//
//  BOFUITests.swift
//  BOFUITests
//
//  Created by Shahin on 2017-04-30.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import XCTest
import KIF

class SigninVCTest: KIFTestCase
{
    typealias access = Constants.AccessibilityLabels
    
    func testLogin()
    {
        tester().waitForView(withAccessibilityLabel: access.email)
        tester().tapView(withAccessibilityLabel: access.email)
        tester().clearText(fromAndThenEnterText: "test@tester.com", intoViewWithAccessibilityLabel: access.email)
    }
}
