//
//  RemoveFromCartViewController.swift
//  Hyakah
//
//  Created by taima on 11/13/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class RemoveFromCartViewController: UIViewController {
    
    var removedObj: Cart = Cart()
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var btnRemove: UIButton!
    @IBOutlet weak var btnCncel: UIButton!

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
    
    @IBAction func btnDismiss(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func btnRemove(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        if let index = vc.items.firstIndex(where: {$0.id == self.removedObj.id}){
        vc.items.remove(at: index)
           
        }
        
        btnDismiss(self)
    }
    
    
}
extension RemoveFromCartViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}
}
