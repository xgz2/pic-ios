//
//  ContainerPageViewController.swift
//  pic-ios
//
//  Created by George Zhuang on 7/29/20.
//  Copyright © 2020 George, Jonna, Judy. All rights reserved.
//

import UIKit

class ContainerPageViewController: UIPageViewController {
    
    private let pages = [CameraViewController(), SelectionController()]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        dataSource = self
        delegate = self
        let initialView = pages[0]
        setViewControllers([initialView], direction: .forward, animated: true, completion: nil)
        didMove(toParent: self)
    }
    
    func prevPageWithIndex(index: Int) {
        setViewControllers([pages[index]], direction: .reverse, animated: true, completion: nil)
    }
    
    func nextPageWithIndex(index: Int) {
        setViewControllers([pages[index]], direction: .forward, animated: true, completion: nil)
    }
    
}

extension ContainerPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    /*
     Comments About Setup: I believe that this is not the most optimized setup of a UIPageViewController. However, for the purposes of a two page app, it is effective. A better implementation would use UIScrollView to add more customization (specifically, to remove bouncing at the end of the view.)
     */

    // Called when swipe left
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentView = viewController
        
        var index = pages.firstIndex(of: currentView)
        if index == 0 {
            return nil
        }
        index! -= 1
        
        let newView = pages[index!]
        return newView
    }
    
    // Called when swipe right
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentVC = viewController
        
        var index = pages.firstIndex(of: currentVC)
        if index! >= pages.count - 1 {
            return nil
        }
        index! += 1
        let newView = pages[index!]
        
        return newView
    }

}
