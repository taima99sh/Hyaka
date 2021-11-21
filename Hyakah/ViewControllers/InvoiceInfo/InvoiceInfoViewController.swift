//
//  InvoiceInfoViewController.swift
//  Hyakah
//
//  Created by taima on 11/15/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class InvoiceInfoViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!

    @IBOutlet weak var txtStreet: UITextField!
    
    @IBOutlet weak var txtHomeNum: UITextField!
    
    @IBOutlet weak var txtCity: UITextField!
    
    @IBOutlet weak var txtPhoneNum: UITextField!
    
    
    @IBOutlet weak var btnSummary: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localized()
        setupData()
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     self.navigationController?.setNavigationBarHidden(false, animated: false)
        
    }
    
    @IBAction func btnSummary(_ sender: Any) {
         guard self.validation() else {return}
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "VerificationViewController") as! VerificationViewController
        vc.isFromInvoiceInfoViewController = true
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension InvoiceInfoViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}
}

extension InvoiceInfoViewController {
    func validation() -> Bool {
        if (txtName.isValidValue && txtStreet.isValidValue && txtHomeNum.isValidValue && txtCity.isValidValue && txtPhoneNum.isValidValue) == false {
            self.ErrorMessage(title: "", errorbody: "هناك حقول فارغة")
            return false
        }
        return true
    }
    

}
