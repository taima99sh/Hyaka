//
//  CartTableViewCell.swift
//  Hyakah
//
//  Created by taima on 11/13/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

struct Cart {
    var id: Int?
    var name: String = ""
    var NumProduct: Int = 0
    var price: Double = 0.0
    var totalPrice = 0.0
    var currency: String = ""
}

class CartTableViewCell: GeneralTableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCounter: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblTotalPrice: UILabel!
    @IBOutlet weak var btnRemove: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func configureCell() {
        if let obj = self.object?.object as? Cart {
            self.lblName.text = obj.name
            self.lblCounter.text = "\(obj.NumProduct)"
            self.lblPrice.text = String(format: " %.0f ر.س", obj.price)
            lblTotalPrice.text = String(format: " %.0f ر.س", obj.price * Double(obj.NumProduct))
        }
        
    }

    @IBAction func btnToRemove(_ sender: Any) {
        if let parent = self.parentVC as? CartViewController {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "RemoveFromCartViewController") as! RemoveFromCartViewController
            vc.removedObj = self.object?.object as? Cart ?? Cart()
            parent.navigationController?.present(vc, animated: false, completion: nil)
        }
    }
    
    @IBAction func btnPlus(_ sender: Any) {
    }
    
    @IBAction func btnMinus(_ sender: Any) {
    }
    
    
}
