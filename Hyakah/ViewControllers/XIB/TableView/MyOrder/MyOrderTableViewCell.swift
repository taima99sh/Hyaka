//
//  MyOrderTableViewCell.swift
//  Hyakah
//
//  Created by taima on 11/11/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

struct Order {
    var orderNum: String = ""
    var date: Date = Date()
    var price: Double = 350.0
    var currency: String = "ر.س"
}

class MyOrderTableViewCell: GeneralTableViewCell {

    @IBOutlet weak var lblNoOfOrder: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func configureCell() {
        if let obj = self.object?.object as? Order {
            self.lblNoOfOrder.text = obj.orderNum
            self.lblDate.text = obj.date.toString(customFormat: "MMM d, yyyy")
            self.lblPrice.text = "\(obj.currency) \(obj.price)"
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let parent = self.parentVC as? MyOrdersViewController {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "OrderInfoViewController") as! OrderInfoViewController
            parent.navigationController?.pushViewController(vc, animated: true)
        }
    }
        
}
