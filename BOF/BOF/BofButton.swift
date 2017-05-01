//
//  BofButton.swift
//  BOF
//
//  Created by Shahin on 2017-04-30.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import UIKit
@IBDesignable

class BofButton: UIButton
{
    override func draw(_ rect: CGRect)
    {
        super.draw(rect)
        backgroundColor = .bofOrange
        setTitleColor(.bofOrange, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }

}
