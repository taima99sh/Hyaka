//
//  BankTransferViewController.swift
//  Hyakah
//
//  Created by taima on 11/14/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class BankTransferViewController: UIViewController {
    
    @IBOutlet weak var txtBankName: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtFourDigits: UITextField!
    @IBOutlet weak var btnConfirm: UIButton!
    

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
    
    @IBAction func btnConfirm(_ sender: Any) {
         guard self.validation() else {return}
    }
    
}
extension BankTransferViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}
}

extension BankTransferViewController {
    func validation() -> Bool {
        if (txtBankName.isValidValue && txtName.isValidValue && txtFourDigits.isValidValue ) == false {
            self.ErrorMessage(title: "", errorbody: "هناك حقول فارغة")
            return false
        }
        return true
    }
}

