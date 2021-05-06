//
//  BookingsViewController.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import UIKit

class BookingTableViewController: UITableViewController {
    
    var bookings: [Booking] = []
    var client = Client()
    var tab : TabViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .blue
        let Bookings = NSLocalizedString("Bookings", comment: "User First Name")
        self.title = Bookings
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44.0
        if let split = self.parent?.parent, let tab = split.parent as? TabViewController{
            self.tab = tab
            self.bookings = tab.booking
        }
    }
}

extension BookingTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookings.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        let booking = self.bookings[indexPath.row]
        
        let nom = NSLocalizedString("Name", comment: "User First Name")
        let Status = NSLocalizedString("Status", comment: "User First Name")
        
        cell?.textLabel?.attributedText =
            NSMutableAttributedString()
            .bold(nom + ": ")
            .normal(booking.user.fullname)
        cell?.detailTextLabel?.attributedText =
            NSMutableAttributedString()
            .bold(Status + ": ")
            .normal(booking.status.rawValue)
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let booking = self.bookings[indexPath.row]
        let detailViewController = BookingDetailViewController()
        detailViewController.booking = booking
        detailViewController.delegate = self
        splitViewController?.showDetailViewController(detailViewController, sender: self)
    }
}

extension BookingTableViewController : ChangeStatus{
    func change(_ booking: Booking) {
        guard let indexpath = tableView.indexPathForSelectedRow else {
            return
        }
        if let tab = tab {
            tab.booking[indexpath.row] = booking
        }
        self.bookings[indexpath.row] = booking
        tableView.reloadData()
    }
}


extension NSMutableAttributedString {
    var fontSize:CGFloat { return 14 }
    var boldFont:UIFont { return UIFont(name: "AvenirNext-Bold", size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize) }
    var normalFont:UIFont { return UIFont(name: "AvenirNext-Regular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)}
    
    func bold(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : boldFont
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func normal(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : normalFont,
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    /* Other styling methods */
    func orangeHighlight(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.orange
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func blackHighlight(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.black
            
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func underlined(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .underlineStyle : NSUnderlineStyle.single.rawValue
            
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
}
