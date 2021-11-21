//
//  SettingsViewController.swift
//  Hyakah
//
//  Created by taima on 11/11/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

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
    
    @IBAction func btnToAboutUs(_ sender: UIButton) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "CMSViewController") as! CMSViewController
        switch sender.tag {
        case 1:
            vc.id = 9892
        case 2:
            vc.id = 3
        case 3:
            vc.id = 9961
        case 4:
            vc.id = 11280
        case 5:
            vc.id = 11713
        default: break
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func btToCallUs(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "CallUsViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnToRateApp(_ sender: Any) {
    }
    
    @IBAction func btnToNotifications(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "NotificationsViewController") as! NotificationsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension SettingsViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}
}
