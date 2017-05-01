//
//  UIView+Extensions.swift
//  BOF
//
//  Created by Shahin on 2017-04-30.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import UIKit

extension UIView
{
    // MARK: - Animation
    func shake()
    {
        let shakeAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        shakeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        shakeAnimation.duration = 0.6
        // lose momentum after time, looks nice
        shakeAnimation.values = [-20, 20, -15, 15, -10, 10, -5, 5, 0]
        layer.add(shakeAnimation, forKey: "shake")
    }
}
