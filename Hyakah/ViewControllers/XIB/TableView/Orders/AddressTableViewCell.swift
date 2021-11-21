//
//  OrdersTableViewCell.swift
//  Hyakah
//
//  Created by taima on 11/12/20.
//  Copyright © 2020 mac air. All rights reserved.
//

struct Address {
    var name: String = ""
    var tiltle: String = ""
    var country: String = ""
    var homeNum: String = ""
    var street: String = ""
}

import UIKit

class AddressTableViewCell: GeneralTableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblStreet: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func configureCell() {
        if let obj = self.object?.object as? Address {
            self.lblTitle.text = obj.tiltle
            self.lblName.text = obj.name
            self.lblCountry.text = "\(obj.street)-\(obj.homeNum)"
                
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let parent = self.parentVC as? AddressesViewController {
            
            if let obj = self.object?.object as? Address {
                if obj.tiltle == "عنوان الفاتورة" {
                    let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "InvoiceAddressViewController") as! InvoiceAddressViewController
                    parent.navigationController?.pushViewController(vc, animated: true)
                } else {
                    let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ShipmentAddressViewController") as! ShipmentAddressViewController
                    parent.navigationController?.pushViewController(vc, animated: true)
                }
            }
           
            
        }
    }
    
}
