//
//  UserTests.swift
//  UserTests
//
//  Created by Shahin on 2017-04-30.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import XCTest
@testable import BOF

class UserTests: XCTestCase
{
    // MARK: - Properties
    var user = User.current
    
    // MARK: - Lifecycle
    override func setUp()
    {
        super.setUp()
    }
    
    func testInitialUserInfo()
    {
        XCTAssertTrue(user.firstName == "")
        XCTAssertTrue(user.lastName == "")
        XCTAssertTrue(user.profileImage == UIImage(named: "profile pic"))
        XCTAssertTrue(user.bofHandle() == "")
        XCTAssertTrue(user.fullName() == "")
    }
    
    func testFinalUnserInfo()
    {
        let userDict = ["firstName": "Shahin",
                        "lastName": "Zangenehpour",
                        "email": "shahinz@mac.com",
                        "password": "Password!",
                        "birthdate": Date()] as [String : Any]
        
        user = user.parse(json: userDict)
        
        XCTAssertTrue(user.firstName == "Shahin")
        XCTAssertTrue(user.lastName == "Zangenehpour")
        XCTAssertTrue(user.bofHandle() == "@shahinz")
        XCTAssertTrue(user.fullName() == "Shahin Zangenehpour")
        XCTAssertTrue(user.email == "shahinz@mac.com")
        XCTAssertEqual(user.password, "Password!")
    }
}
