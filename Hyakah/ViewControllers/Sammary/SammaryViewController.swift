//
//  SammaryViewController.swift
//  Hyakah
//
//  Created by taima on 11/14/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class SammaryViewController: UIViewController {
    

    
    @IBOutlet weak var lblTotal: UILabel!
    
    @IBOutlet weak var lblTotalAsNum: UILabel!
    
    @IBOutlet weak var lblDiscount: UILabel!
    
    @IBOutlet weak var lblDiscountAsNum: UILabel!
    
    @IBOutlet weak var lblPayWhenRecive: UILabel!
    
    @IBOutlet weak var lblPayWhenReceiveAsNum: UILabel!
    
    @IBOutlet weak var lblPromotionalCode: UILabel!
    

    
    @IBOutlet weak var lblTotalSummation: UILabel!
    
    @IBOutlet weak var lblTotalSummationAsNum: UILabel!

    @IBOutlet weak var btnPayNow: UIButton!
    
    @IBOutlet weak var txtAddCoupon: UITextField!
    
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
    
    @IBAction func btnPayNow(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "CompletedOrderViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    

    
}
extension SammaryViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}
}
