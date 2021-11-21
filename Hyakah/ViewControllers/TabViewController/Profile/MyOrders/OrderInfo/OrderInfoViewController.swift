//
//  OrderInfoViewController.swift
//  Hyakah
//
//  Created by taima on 11/12/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class OrderInfoViewController: UIViewController {
    
    enum typePage: String {
        case shipmentAddress
        case PurchaseDetails
    }
    
    @IBOutlet weak var ShipmentAddressStackView: UIStackView!
    
    @IBOutlet weak var PurchaseDetailsStackView: UIStackView!
    
    @IBOutlet weak var btnPurchaseDetails: UIButton!
    
    @IBOutlet weak var btnShipmentAddress: UIButton!
    
    @IBOutlet weak var btnSave: UIButton!
    // ShipmentAddress
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtPhoneNum: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    // PurchaseDetails

    @IBOutlet weak var lblOrderNum: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblTotal: UILabel!
    
    @IBOutlet weak var lblTotalAsNum: UILabel!
    
    @IBOutlet weak var lblDiscount: UILabel!
    
    @IBOutlet weak var lblDiscountAsNum: UILabel!
    
    @IBOutlet weak var lblPayWhenRecive: UILabel!
    
    @IBOutlet weak var lblPayWhenReceiveAsNum: UILabel!
    
    @IBOutlet weak var lblPromotionalCode: UILabel!
    
    @IBOutlet weak var lblPromotionalCodeAsNum: UILabel!
    
    @IBOutlet weak var lblTotalSummation: UILabel!
    
    @IBOutlet weak var lblTotalSummationAsNum: UILabel!
    
    var type: typePage = .PurchaseDetails {
        didSet {
            updateGUI()
        }
    }
    
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
    }
    
    @IBAction func btnPurchaseDetails(_ sender: Any) {
        self.type = .PurchaseDetails
    }
    
    
    @IBAction func btnShipmentAddress(_ sender: Any) {
        self.type = .shipmentAddress
    }
    
    
}
extension OrderInfoViewController {
    func setupView(){
        self.type = .PurchaseDetails
    }
    func localized(){}
    func setupData(){}
    func fetchData(){}
}

extension OrderInfoViewController {
    func updateGUI() {
        switch self.type {case .shipmentAddress:
            self.btnShipmentAddress.backgroundColor = "#32313A".color_
            self.btnPurchaseDetails.backgroundColor  = .clear
            self.ShipmentAddressStackView.isHidden = false
            self.PurchaseDetailsStackView.isHidden = true

        case .PurchaseDetails:
            self.btnPurchaseDetails.backgroundColor = "#32313A".color_
            self.btnShipmentAddress.backgroundColor  = .clear
            self.ShipmentAddressStackView.isHidden = true
            self.PurchaseDetailsStackView.isHidden = false

        }
    }
}






