//
//  CartViewController.swift
//  Hyakah
//
//  Created by taima on 11/13/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var tableView: GeneralTableView!

    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var codeStackView: UIStackView!
    
    @IBOutlet weak var notLoginStackView: UIStackView!
    @IBOutlet weak var loginStackView: UIStackView!
    
    var items: [Cart] = [Cart(id: 1, name: "عباية لنن لف بلون ", NumProduct: 4, price: 449, totalPrice: 0, currency: "ر.س"),
    Cart(id: 2, name: "عباية لنن لف بلون ", NumProduct: 4, price: 449, totalPrice: 0, currency: "ر.س"),
    Cart(id: 3, name: "عباية لنن لف بلون ", NumProduct: 4, price: 449, totalPrice: 0, currency: "ر.س"),
    Cart(id: 4, name: "عباية لنن لف بلون ", NumProduct: 4, price: 449, totalPrice: 0, currency: "ر.س"),
    Cart(id: 5, name: "عباية لنن لف بلون ", NumProduct: 4, price: 449, totalPrice: 0, currency: "ر.س"),
    Cart(id: 6, name: "عباية لنن لف بلون ", NumProduct: 4, price: 449, totalPrice: 0, currency: "ر.س")]
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
    
    @IBAction func btnBuyNow(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "InvoiceInfoViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension CartViewController {
    func setupView(){
        bottomView.clipsToBounds = true
        bottomView.layer.cornerRadius = 30
        bottomView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        tableView.register(UINib.init(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
        
        notLoginStackView.isHidden = UserProfile.shared.isUserLogin() ? true : false
        
        loginStackView.isHidden = UserProfile.shared.isUserLogin() ? false : true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // your code here
            self.codeStackView.isHidden = self.items.isEmpty ? true : false
            
            self.bottomView.isHidden = self.items.isEmpty ? true : false
        }
        
    }
    func localized(){}
    func setupData(){
        self.tableView.EmptyDataTitle = "لاتوجد عناصر في السلة"
        tableView.EmptyDataImage = "noOrdersImage".image_
        self.tableView.isSelfSize = true
        self.fillTable(arr: items)

    }
    func fetchData(){}
}

extension CartViewController {
    func fillTable(arr: [Cart] = []) {
        if isTableArrayEmpty() {return}
        self.tableView.objects.removeAll()
//        tableView.isSelfSize = true
        for obj in arr {
            tableView.objects.append(GeneralTableViewData.init(identifier: "CartTableViewCell", object: obj, rowHeight: nil))
        }
        tableView.reloadData()
    }
    
    func isTableArrayEmpty() -> Bool {
        if items.isEmpty {
            self.tableView.EmptyDataTitle = "لاتوجد عناصر في السلة"
            tableView.EmptyDataImage = "surprisedIcon".image_
            self.codeStackView.isHidden = false
            self.bottomView.isHidden = false
            self.tableView.objects.removeAll()
            self.tableView.reloadData()
            
            return true
        }
        return false
    }
}

