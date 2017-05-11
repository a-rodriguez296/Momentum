//
//  TabBarViewController.swift
//  Momentum
//
//  Created by Alejandro Rodriguez on 5/11/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        delegate = self
    }
}

extension TabBarViewController: UITabBarControllerDelegate{
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        switch tabBarController.selectedIndex {
        case 0:
            NotificationCenter.default.post(name: Notification.Name(Constants.Notifications.didSelectTableDetail), object: nil)
        default:
            NotificationCenter.default.post(name: Notification.Name(Constants.Notifications.didSelectCollectionDetail), object: nil)
        }
    }
}



