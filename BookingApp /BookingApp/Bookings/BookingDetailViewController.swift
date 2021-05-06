//
//  BooingDetailTableViewController.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import UIKit

protocol ChangeStatus {
    func change(_ booking: Booking) -> Void
}

class BookingDetailViewController: UIViewController {
    
    var booking: Booking?

    var name : UILabel?
    var gender : UILabel?
    var email : UILabel?
    var phone : UILabel?
    var status : UILabel?
    var button : UIButton?
    
    var delegate : ChangeStatus?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
                    self.setupUI()
                }
        
    
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
            super.viewWillTransition(to: size, with: coordinator)
            DispatchQueue.main.async {
                self.setupUI()
            }
        }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func setupUI() -> Void {
        
        name?.removeFromSuperview()
        gender?.removeFromSuperview()
        email?.removeFromSuperview()
        phone?.removeFromSuperview()
        status?.removeFromSuperview()
        
        self.view.backgroundColor = .purple
        let User_Details = NSLocalizedString("User Details", comment: "User First Name")
        self.title = User_Details
        
        let nom = NSLocalizedString("Name", comment: "User First Name")
        let Status = NSLocalizedString("Booking Status", comment: "User First Name")
        let number = NSLocalizedString("Phone Number", comment: "User First Name")
        let emailtext = NSLocalizedString("Email", comment: "User First Name")
        let gendertext = NSLocalizedString("Gender", comment: "User First Name")
        let Change_Status = NSLocalizedString("Change Status", comment: "User First Name")
        
        self.name = createlabel(nom + " : ", text: booking?.user.fullname ?? "", frame: CGRect(x: 10, y: 84, width: self.view.frame.width - 20, height: 50))
        self.gender = createlabel(gendertext + " : ", text: booking?.user.gender.rawValue ?? "" , frame: CGRect(x: 10, y: name!.frame.maxY + 10, width: self.view.frame.width - 20, height: 50))
        self.email = createlabel(emailtext + " : ", text: booking?.user.email ?? "" , frame: CGRect(x: 10, y: gender!.frame.maxY + 10, width: self.view.frame.width - 20, height: 50))
        self.phone = createlabel(number + " : ", text: booking?.user.phone ?? "" , frame: CGRect(x: 10, y: email!.frame.maxY + 10, width: self.view.frame.width - 20, height: 50))
        self.status = createlabel(Status + " : ", text: booking?.status.rawValue ?? "" , frame: CGRect(x: 10, y: phone!.frame.maxY + 10, width: self.view.frame.width - 20, height: 50))
        
        self.button?.removeFromSuperview()
        self.button = UIButton(frame: CGRect(x: 40, y: status!.frame.maxY + 20, width: self.view.frame.width - 80, height: 40))
        button!.addTarget(self, action: #selector(self.buttonclick(_:)), for: .touchUpInside)
        button!.setTitle(Change_Status, for: .normal)
        button!.backgroundColor = .white
        button!.layer.cornerRadius = 10
        button!.setTitleColor(.black, for: .normal)
        self.view.addSubview(button!)
        
    }
    
    @objc func buttonclick(_ sender:UIButton) -> Void {
        let myViewController = BookingStatusViewController(nibName: "BookingStatusViewController", bundle: nil)
        myViewController.booking = booking
        myViewController.delegate = self
        self.present(myViewController, animated: true, completion: nil)
    }
    
    func createlabel(_ title:String = "", text: String = "", frame:CGRect, textalign: NSTextAlignment = .left) -> UILabel {
        let label = UILabel(frame: frame)
        label.textColor = .white
        label.textAlignment = textalign
        label.attributedText =
            NSMutableAttributedString()
                .bold(title)
                .normal(text)
        self.view.addSubview(label)
        return label
    }
}

extension BookingDetailViewController: ChangeBookingStatus {
    func chnages(_ booking: Booking?) {
        self.booking = booking
        delegate?.change(booking!)
        self.setupUI()
    }
}
