//
//  CallUsViewController.swift
//  Hyakah
//
//  Created by taima on 11/14/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class CallUsViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtContact: UITextView!

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
    
    @IBAction func btnSend(_ sender: Any) {
         guard self.validation() else {return}
    }
    
}
extension CallUsViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}
}

extension CallUsViewController {
    func validation() -> Bool {
        if (txtName.isValidValue && txtEmail.isValidValue && txtAddress.isValidValue && txtContact.isValidValue && Emailvalidation()) == false {
            self.ErrorMessage(title: "", errorbody: "هناك حقول فارغة")
        }
        return true
    }
    
    func Emailvalidation() -> Bool {
        if !(txtEmail.text?.isValidEmail()  ?? true) {
            self.ErrorMessage(title: "", errorbody: "البريد الالكتروني عير صحيح")
            return false
        }
        return true
    }
}
