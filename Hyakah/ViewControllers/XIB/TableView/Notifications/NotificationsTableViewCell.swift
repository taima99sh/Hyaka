//
//  NotificationsTableViewCell.swift
//  Hyakah
//
//  Created by taima on 11/12/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit
struct Notification {
    var title: String = ""
    var text: String = ""
    var date: Date = Date()
}

class NotificationsTableViewCell: GeneralTableViewCell {
    
    @IBOutlet weak var lblNotificationTiltle: UILabel!
    @IBOutlet weak var lblNotificationText: UILabel!
    @IBOutlet weak var lblDate: UILabel!
     
    override func configureCell() {
        if let obj = self.object?.object as? Notification {
            self.lblDate.text = obj.date.toString(customFormat: "MM/dd/yyyy")
            self.lblNotificationTiltle.text = obj.title
            self.lblNotificationText.text = obj.text
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
