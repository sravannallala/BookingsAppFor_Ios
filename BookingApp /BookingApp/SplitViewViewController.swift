//
//  SplitViewViewController.swift
//  BookingApp
//
//  Created by sravan on 5/5/21.
//  Copyright © 2021 zenchef. All rights reserved.
//

import UIKit

class SplitViewViewController: UISplitViewController, UISplitViewControllerDelegate {
        
        override func viewDidLoad() {
            self.delegate = self
                        let master = UINavigationController()
                        master.viewControllers = [BookingTableViewController()]
                        self.viewControllers = [master]
           
        }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.preferredDisplayMode = .allVisible
        }
        
        func splitViewController(
                 _ splitViewController: UISplitViewController,
                 collapseSecondary secondaryViewController: UIViewController,
                 onto primaryViewController: UIViewController) -> Bool {
            // Return true to prevent UIKit from applying its default behavior
            return true
        }

}
