//
//  AddressesViewController.swift
//  Hyakah
//
//  Created by taima on 11/12/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class AddressesViewController: UIViewController {
    
    @IBOutlet weak var tableView: GeneralTableView!
    
    var addresses: [Address] = [Address(name: "ليلى خليفة", tiltle: "عنوان الفاتورة", country: "المملكة العربية السعودية", homeNum: "354/543", street: "شارع فلسطين"),
    Address(name: "ليلى خليفة", tiltle: "عنوان الشحن", country: "المملكة العربية السعودية", homeNum: "354/543", street: "شارع فلسطين")]

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
}
extension AddressesViewController {
    func setupView(){
        tableView.register(UINib.init(nibName: "AddressTableViewCell", bundle: nil), forCellReuseIdentifier: "AddressTableViewCell")
    }
    func localized(){}
    func setupData(){
        self.tableView.EmptyDataTitle = "لاتوجد عناويين"
        self.tableView.isSelfSize = true
        for obj in addresses {
            tableView.objects.append(GeneralTableViewData.init(identifier: "AddressTableViewCell", object: obj, rowHeight: nil))
        }
    }
    func fetchData(){}
}
