//
//  MyOrdersViewController.swift
//  Hyakah
//
//  Created by taima on 11/11/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class MyOrdersViewController: UIViewController {
    
    enum typePage: String {
        case inProgress
        case completed
        case canceled
    }

    @IBOutlet weak var noOrdersStack: UIStackView!
    @IBOutlet weak var btnInProgress: UIButton!
    @IBOutlet weak var btnCompleted: UIButton!
    @IBOutlet weak var btnCanceled: UIButton!
    @IBOutlet weak var tableView: GeneralTableView!
    
    var tableArray: [Order] = [Order(orderNum: "13478", date: Date(), price: 305.5),
    Order(orderNum: "13478", date: Date(), price: 305.5),
    Order(orderNum: "13478", date: Date(), price: 305.5),
    Order(orderNum: "13478", date: Date(), price: 305.5),
    Order(orderNum: "13478", date: Date(), price: 305.5),
    Order(orderNum: "13478", date: Date(), price: 305.5)]
    
    
    var type: typePage = .inProgress {
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
    
    @IBAction func btnInProgress(_ sender: Any) {
        self.type = .inProgress
        self.fillTable(arr: tableArray)
    }
    
    @IBAction func btnCompleted(_ sender: Any) {
        self.type = .completed
        tableArray = []
        self.fillTable(arr: tableArray)
    }
    
    @IBAction func btnCanceled(_ sender: Any) {
        self.type = .canceled
        self.fillTable(arr: tableArray)
    }
    
    @IBAction func btnToHome(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "TabBarController")
        AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
    }
}
extension MyOrdersViewController {
    
    func setupView(){
      tableView.register(UINib.init(nibName: "MyOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "MyOrderTableViewCell")
       self.type = .inProgress
       self.noOrdersStack.isHidden = true
        
    }
    func localized(){}
    func setupData(){
        tableView.isSelfSize = true
        self.fillTable(arr: tableArray)
    }
    func fetchData(){}
    

}

extension MyOrdersViewController {
    func updateGUI() {
        switch self.type {
        case .inProgress:
            self.btnInProgress.backgroundColor = "#32313A".color_
            self.btnCompleted.backgroundColor  = .clear
            self.btnCanceled.backgroundColor   = .clear
            // change table view content
        case .completed:
            self.btnCompleted.backgroundColor = "#32313A".color_
            self.btnInProgress.backgroundColor  = .clear
            self.btnCanceled.backgroundColor   = .clear
            // change table view content
           
        case .canceled:
            self.btnCanceled.backgroundColor = "#32313A".color_
            self.btnCompleted.backgroundColor  = .clear
            self.btnInProgress.backgroundColor   = .clear
            // change table view content
        }
    }
    
    func isTableArrayEmpty() -> Bool {
        if tableArray.isEmpty {
            tableView.EmptyDataTitle = "لاتوجد طلبات"
            tableView.EmptyDataImage = "noOrdersImage".image_
            self.noOrdersStack.isHidden = false
            self.tableView.objects = []
            self.tableView.reloadData()
            
            return true
        }
        return false
    }
    
    func fillTable(arr: [Order]) {
        if isTableArrayEmpty() {return}
        for obj in arr {
            tableView.objects.append(GeneralTableViewData.init(identifier: "MyOrderTableViewCell", object: obj, rowHeight: nil))
        }
        tableView.reloadData()
    }
}


