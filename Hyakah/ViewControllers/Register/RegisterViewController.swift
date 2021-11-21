//
//  RegisterViewController.swift
//  Hyakah
//
//  Created by taima on 11/8/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var lblRegister: UILabel!
    
    @IBOutlet weak var lblUnderRegister: UILabel!
    
    @IBOutlet weak var txtPhoneNum: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
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
    @IBAction func btnRegister(_ sender: Any) {
         guard self.validation() else {return}
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "TabBarController")
        //UserProfile.shared.isLoggined = true
        AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
    }
    
    @IBAction func btnToLogin(_ sender: Any) {
         guard self.validation() else {return}
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController")
        AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
    }
    
}
extension RegisterViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}
}

extension RegisterViewController {
    func validation() -> Bool {
        if (txtConfirmPassword.isValidValue && txtPhoneNum.isValidValue && txtEmail.isValidValue && txtPassword.isValidValue && Emailvalidation()) == false {
            self.ErrorMessage(title: "", errorbody: "هناك حقول فارغة")
            return false
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


