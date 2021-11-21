//
//  ForgetPasswordViewController.swift
//  Hyakah
//
//  Created by taima on 11/7/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: UIViewController {
    
//    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var lblForgetPassword: UILabel!
    @IBOutlet weak var lblUnderForgetPassword: UILabel!
    @IBOutlet weak var btnSend: UIButton!
    
    @IBOutlet weak var txtPhoneNum: UITextField!
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
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "CodeChangePasswordViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnToLogin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension ForgetPasswordViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}
}

extension ForgetPasswordViewController {
    func validation() -> Bool {
        if (txtPhoneNum.isValidValue) == false {
            self.ErrorMessage(title: "", errorbody: "يجب إدخال رقم الجوال")
            return false
        }
        return true
    }
    

}
