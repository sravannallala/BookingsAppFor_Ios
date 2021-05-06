//
//  TabViewController.swift
//  BookingApp
//
//  Created by sravan on 5/6/21.
//  Copyright © 2021 zenchef. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {
    
    var booking = [Booking]()
    
    override func viewDidLoad() {
        let splitViewController =  SplitViewViewController()
        let homecontroller = HomeViewController()
        let settingsController = SettingViewController()
        self.viewControllers = [
            homecontroller,
            splitViewController,
            settingsController
        ]
        
        CallAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let items = tabBar.items else { return }

        let firstname = NSLocalizedString("Home", comment: "User First Name")
        let Bookings = NSLocalizedString("Bookings", comment: "User First Name")
        let Setting = NSLocalizedString("Setting", comment: "User First Name")
        
        items[0].title = firstname
        items[1].title = Bookings
        items[2].title = Setting
        
        if #available(iOS 13.0, *) {
            items[0].image = UIImage.init(systemName: "house")
        } else {
            // Fallback on earlier versions
           
        }
        if #available(iOS 13.0, *) {
            items[1].image = UIImage.init(systemName: "list.and.film")
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 13.0, *) {
            items[2].image = UIImage.init(systemName: "ellipsis.circle")
        } else {
            // Fallback on earlier versions
        }
    }

    
    func CallAPI() ->  Void {
        let client = Client()
        self.booking = client.getBookings(25)
    }
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


