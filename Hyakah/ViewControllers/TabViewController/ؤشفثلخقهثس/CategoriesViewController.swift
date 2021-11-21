//
//  CategoriesViewController.swift
//  Hyakah
//
//  Created by taima on 11/8/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    var categories: [CategoriesModel] = []
    @IBOutlet weak var tableView: GeneralTableView!
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
           self.tabBarController?.navigationItem.title = "الأقسام"
           self.tabBarController?.navigationItem.rightBarButtonItem  = nil
           
       }
    
    @IBAction func btn(_ sender: Any) {
        
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ItemViewControllers")
        AppDelegate.shared.rootNavigationViewController.pushViewController(vc, animated: false)
    }
    
}
extension CategoriesViewController {
    func setupView(){
        tableView.register(UINib.init(nibName: "CategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoriesTableViewCell")
    }
    func localized(){}
    func setupData(){
        tableView.generalRowHeight = UIScreen.main.bounds.size.height * (120/818) + 28
        tableView.EmptyDataTitle = "لايوجد بيانات لعرضها"
    }
    func fetchData(){
       self.showIndicator(withTitle: nil, and: nil)
        CategorController.shared(viewController: self).getCategor { (categories) in
            if let categories = categories {
                for category in categories {
                    if category.name != "Uncategorized" {
                        self.tableView.objects.append(GeneralTableViewData.init(identifier: "CategoriesTableViewCell", object: category, rowHeight: nil))
                    }
                }
                self.tableView.reloadData()
                self.hideIndicator()
            }
        }
    }
}

