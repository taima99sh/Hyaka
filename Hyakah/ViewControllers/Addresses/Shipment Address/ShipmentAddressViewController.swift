//
//  ShipmentAddressViewController.swift
//  Hyakah
//
//  Created by taima on 11/12/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class ShipmentAddressViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!

    @IBOutlet weak var txtStreet: UITextField!
    
    @IBOutlet weak var txtHomeNum: UITextField!
    
    @IBOutlet weak var txtCity: UITextField!
    
    @IBOutlet weak var txtPhoneNum: UITextField!
    
    @IBOutlet weak var btnSave: UIButton!
    
    
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
    
    @IBAction func btnSave(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
extension ShipmentAddressViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}
}

extension ShipmentAddressViewController {
    func validation() -> Bool {
        if (txtName.isValidValue && txtStreet.isValidValue && txtHomeNum.isValidValue && txtCity.isValidValue && txtPhoneNum.isValidValue) == false {
            self.ErrorMessage(title: "", errorbody: "هناك حقول فارغة")
            return false
        }
        return true
    }
    

}
