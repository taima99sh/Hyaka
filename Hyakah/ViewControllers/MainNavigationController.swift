//
//  MainNavigationController.swift
//  Hyakah
//
//  Created by taima on 11/8/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

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
        
        if var textAttributes = self.navigationBar.titleTextAttributes {
            textAttributes[NSAttributedString.Key.font] = Constant.shared.ProjectFont.toFont(size: 20) ?? UIFont(name: "Arial", size: 14)
            self.navigationBar.titleTextAttributes = textAttributes
        }

    }
    
    
}
extension MainNavigationController {
    func setupView(){
        AppDelegate.shared.rootNavigationViewController = self
        
        if UserProfile.shared.isUserLogin() {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "TabBarController")
            AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
        } else {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "FirstScreenViewController")
            AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
        }
    }
    func localized(){}
    func setupData(){}
    func fetchData(){}
}
