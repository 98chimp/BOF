//
//  WelcomePageViewController.swift
//  BOF
//
//  Created by Shahin on 2017-04-30.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import UIKit

class OnboardingPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource
{
    fileprivate typealias storyboards = Constants.Storyboards
    fileprivate typealias viewControllerNames = Constants.ViewControllers
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }

    lazy var welcomeViewControllers: [UIViewController] = {
            return [self.createViewControllerInstance(with: viewControllerNames.welcome1VC),
                    self.createViewControllerInstance(with: viewControllerNames.welcome2VC),
                    self.createViewControllerInstance(with: viewControllerNames.welcome3VC),
                    self.createViewControllerInstance(with: viewControllerNames.welcome4VC),
            ]
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        if let firstViewController = welcomeViewControllers.first
        {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        
        for view in view.subviews
        {
            if view is UIScrollView
            {
                view.frame = UIScreen.main.bounds
            }
            else if view is UIPageControl
            {
                let newCenter = CGPoint(x: view.center.x, y: self.view.bounds.height - 75)
                view.center = newCenter
                view.backgroundColor = .clear
            }
        }
    }
    
    // MARK: - Data Source
    func presentationCount(for pageViewController: UIPageViewController) -> Int
    {
        return welcomeViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int
    {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = welcomeViewControllers.index(of: firstViewController) else { return 0 }
        return firstViewControllerIndex
    }
    
    // MARK: - Delegate
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        guard let vcIndex = welcomeViewControllers.index(of: viewController) else { return nil }
        let previousIndex = vcIndex - 1
        guard  previousIndex >= 0 else { return nil }
        guard  welcomeViewControllers.count > previousIndex else { return nil }
        
        return welcomeViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let vcIndex = welcomeViewControllers.index(of: viewController) else { return nil }
        let nextIndex = vcIndex + 1
        guard  welcomeViewControllers.count != nextIndex else { return nil }
        guard  welcomeViewControllers.count > nextIndex else { return nil }
        
        return welcomeViewControllers[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool)
    {
        if completed
        {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    // MARK: - Helpers
    func createViewControllerInstance(with viewControllerName: String) -> UIViewController
    {
        return UIStoryboard(name: storyboards.welcome, bundle: Bundle.main).instantiateViewController(withIdentifier: viewControllerName)
    }
}
