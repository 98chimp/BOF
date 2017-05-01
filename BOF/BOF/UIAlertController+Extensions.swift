//
//  UIAlertController+Extensions.swift
//  BOF
//
//  Created by Shahin on 2017-04-30.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import UIKit

extension UIAlertController
{
    func show()
    {
        present(animated: true, completion: nil)
    }
    
    func present(animated: Bool, completion: (() -> Void)?)
    {
        if let rootVC = UIApplication.shared.keyWindow?.rootViewController
        {
            presentFromController(controller: rootVC, animated: animated, completion: completion)
        }
    }
    
    private func presentFromController(controller: UIViewController, animated: Bool, completion: (() -> Void)?)
    {
        if let navVC = controller as? UINavigationController, let visibleVC = navVC.visibleViewController
        {
            presentFromController(controller: visibleVC, animated: animated, completion: completion)
        }
        else if let tabVC = controller as? UITabBarController, let selectedVC = tabVC.selectedViewController
        {
            presentFromController(controller: selectedVC, animated: animated, completion: completion)
        }
        else
        {
            controller.present(self, animated: animated, completion: completion);
        }
    }
    
    func addAction(withTitle title: String?, style: UIAlertActionStyle = .default, handler: (() -> Void)? = nil)
    {
        addAction(UIAlertAction(title: title, style: style, handler: { _ in
            handler?()
        }))
    }
}
