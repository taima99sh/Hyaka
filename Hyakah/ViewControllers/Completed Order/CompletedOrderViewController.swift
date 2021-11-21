//
//  CompletedOrderViewController.swift
//  Hyakah
//
//  Created by taima on 11/14/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class CompletedOrderViewController: UIViewController {
    
    @IBOutlet weak var lblOrderNum: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblTotal: UILabel!
    
  
    @IBOutlet weak var lblPaymentMethod: UILabel!
    
    @IBOutlet weak var brnGoToHome: UIButton!
    

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
        self.navigationController?.setNavigationBarHidden(false, animated: false)    }
    
    @IBAction func brnGoToHome(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "TabBarController")
        AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
    }
    
}
extension CompletedOrderViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}
}
