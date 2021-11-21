//
//  ChangePasswordViewController.swift
//  Hyakah
//
//  Created by taima on 11/12/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    @IBOutlet weak var txtOldPassword: UITextField!
    @IBOutlet weak var txtNewPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var btnSve: UIButton!

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
         guard self.validation() else {return}
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension ChangePasswordViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}
}

extension ChangePasswordViewController {
    func validation() -> Bool {
        if (txtConfirmPassword.isValidValue && txtOldPassword.isValidValue && txtNewPassword.isValidValue) == false {
            self.ErrorMessage(title: "", errorbody: "هناك حقول فارغة")
            return false
        }
        return true
    }
    

}
