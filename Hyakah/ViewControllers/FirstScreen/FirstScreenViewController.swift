//
//  FirstScreenViewController.swift
//  Hyakah
//
//  Created by taima on 11/8/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class FirstScreenViewController: UIViewController {

    
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
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func btnAsVisitor(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "TabBarController")
        
       // UserProfile.shared.isLoggined = false
        AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
    }
    
    @IBAction func btnRegister(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "RegisterViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
extension FirstScreenViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}
}
