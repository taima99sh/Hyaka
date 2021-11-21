//
//  NotificationsViewController.swift
//  Hyakah
//
//  Created by taima on 11/12/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {
    @IBOutlet weak var tableView: GeneralTableView!
    
    var notifications: [Notification] = [Notification(title: "عرض خاص لك", text: "عباية رائعة و ممتازة وتصميم أنيق", date: Date()),
    Notification(title: "عرض خاص لك", text: "عباية رائعة و ممتازة وتصميم أنيق", date: Date()),
    Notification(title: "عرض خاص لك", text: "عباية رائعة و ممتازة وتصميم أنيق", date: Date()),
    Notification(title: "عرض خاص لك", text: "عباية رائعة و ممتازة وتصميم أنيق", date: Date()),
    Notification(title: "عرض خاص لك", text: "عباية رائعة و ممتازة وتصميم أنيق", date: Date())]

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
}
extension NotificationsViewController {
    func setupView(){
        tableView.register(UINib.init(nibName: "NotificationsTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationsTableViewCell")
    }
    func localized(){}
    func setupData(){
        self.tableView.EmptyDataTitle = "لاتوجد إشعارات"
        self.tableView.isSelfSize = true
        for obj in notifications {
            tableView.objects.append(GeneralTableViewData.init(identifier: "NotificationsTableViewCell", object: obj, rowHeight: nil))
        }
    }
    func fetchData(){}
}
