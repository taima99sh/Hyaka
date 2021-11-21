//
//  VerificationViewController.swift
//  Hyakah
//
//  Created by taima on 11/8/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class VerificationViewController: UIViewController {
    @IBOutlet weak var lblEnterCode: UILabel!
    @IBOutlet weak var lblUnderEnterCode: UILabel!
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt3: UITextField!
    @IBOutlet weak var txt4: UITextField!
    @IBOutlet weak var btnConfirm: UIButton!
    @IBOutlet weak var btnResend: UIButton!
    
    var isFromInvoiceInfoViewController: Bool = false
    
    
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
        if self.isFromInvoiceInfoViewController {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "PaymentTypeViewController")
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "AddPasswordViewController")
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    @IBAction func btnReSend(_ sender: Any) {
         guard self.validation() else {return}
    }
}
extension VerificationViewController {
    func setupView(){
        self.txt1.delegate = self
        self.txt2.delegate = self
        self.txt3.delegate = self
        self.txt4.delegate = self
        txt1.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        txt2.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        txt3.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        txt4.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    func localized(){}
    func setupData(){}
    func fetchData(){}
}

extension VerificationViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        let text = textField.text
        if  text?.count == 1 {
            switch textField{
            case txt1:
                txt2.becomeFirstResponder()
            case txt2:
                txt3.becomeFirstResponder()
            case txt3:
                txt4.becomeFirstResponder()
            case txt4:
                txt4.resignFirstResponder()
            default:
                break
            }
        }
        if  text?.count == 0 {
            switch textField{
            case txt1:
                txt1.becomeFirstResponder()
            case txt2:
                txt1.becomeFirstResponder()
            case txt3:
                txt2.becomeFirstResponder()
            case txt4:
                txt3.becomeFirstResponder()
            default:
                break
            }
        }
        else{

        }
    }

}

extension VerificationViewController {
    func validation() -> Bool {
        if (txt1.isValidValue && txt2.isValidValue && txt3.isValidValue && txt4.isValidValue) == false {
            self.ErrorMessage(title: "", errorbody: "هناك حقول فارغة")
            return false
        }
        return true
    }
    
}
