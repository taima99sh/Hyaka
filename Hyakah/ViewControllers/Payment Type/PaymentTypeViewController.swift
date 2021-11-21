//
//  PaymentTypeViewController.swift
//  Hyakah
//
//  Created by taima on 11/13/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit
import BEMCheckBox

class PaymentTypeViewController: UIViewController {
    @IBOutlet weak var paiementWhenRecievingCheckBox: BEMCheckBox!
    @IBOutlet weak var madaCheckBox: BEMCheckBox!
    @IBOutlet weak var creditCardCheckBox: BEMCheckBox!
    @IBOutlet weak var bankTransfercheckBox: BEMCheckBox!
    @IBOutlet weak var privacyCheckBox: BEMCheckBox!
    
    @IBOutlet weak var btnConfirm: UIButton!
    
    
    
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
    
    @IBAction func btnConfirm(_ sender: Any) {
         guard self.validation() else {return}
        if bankTransfercheckBox.on {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "BankTransferViewController")
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "SammaryViewController")
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}
extension PaymentTypeViewController {
    func setupView(){
        self.paiementWhenRecievingCheckBox.boxType = .square
        self.madaCheckBox.boxType = .square
        self.creditCardCheckBox.boxType = .square
        self.bankTransfercheckBox.boxType = .square
        self.privacyCheckBox.boxType = .square
        
        let group = BEMCheckBoxGroup(checkBoxes: [paiementWhenRecievingCheckBox, madaCheckBox, creditCardCheckBox, bankTransfercheckBox])
         group.selectedCheckBox = paiementWhenRecievingCheckBox // Optionally set which checkbox is pre-selected
         group.mustHaveSelection = true
        
    }
    func localized(){}
    func setupData(){}
    func fetchData(){}
}

extension PaymentTypeViewController {
    func validation() -> Bool {
        if (self.privacyCheckBox.on) == false {
            self.ErrorMessage(title: "", errorbody: " يجب الموافقة على الشروط والأحكام")
            return false
        }
        return true
    }
    

}

