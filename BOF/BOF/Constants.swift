//
//  Constants.swift
//  BOF
//
//  Created by Shahin on 2017-04-30.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import UIKit

func execute(after delay:Double, closure:@escaping ()->())
{
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

struct Constants
{
    struct Identifiers
    {
        struct Cells
        {
            
        }
        
        struct Segues
        {
            static let toMainStoryboard = "toMainStoryboard"
            static let toSigninStoryboard = "toSigninStoryboard"
        }
    }
}
