//
//  BookingStatusViewController.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import UIKit

protocol ChangeBookingStatus {
    func chnages(_ booking: Booking?) -> Void
}

class BookingStatusViewController: UIViewController {

    @IBOutlet weak var waitingButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var confirmedButton: UIButton!
    @IBOutlet weak var status: UILabel!
    
    var booking : Booking?
    
    var delegate : ChangeBookingStatus?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let Change_Status = NSLocalizedString("Change Status", comment: "User First Name")
        let Confirm = NSLocalizedString("Confirm", comment: "User First Name")
        let Waiting = NSLocalizedString("Waiting", comment: "User First Name")
        let Cancel = NSLocalizedString("Cancel", comment: "User First Name")
        
        status.text = Change_Status
        confirmedButton.setTitle(Confirm, for: .normal)
        waitingButton.setTitle(Waiting, for: .normal)
        cancelButton.setTitle(Cancel, for: .normal)
    }
    
    @IBAction func confirmAction(_ sender: Any) {
        booking?.status = .confirmed
        self.dismiss()
    }
    
    @IBAction func waitingAction(_ sender: Any) {
        booking?.status = .waiting
        self.dismiss()
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        booking?.status = .cancel
        self.dismiss()
    }
    
    func dismiss() {
        delegate?.chnages(booking ?? nil)
        self.dismiss(animated: true)
    }
}
