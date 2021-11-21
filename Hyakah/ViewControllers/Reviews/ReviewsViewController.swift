//
//  ReviewsViewController.swift
//  Hyakah
//
//  Created by taima on 11/10/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class ReviewsViewController: UIViewController {

    @IBOutlet weak var tableView: GeneralTableView!
    var productReviews: [ReviewModel] = []
    var reviews: [Review] = [Review(name: "ليلى خليفة ", text: "عباية رائعة و ممتازة وتصميم أنيق", image: "", id: 1, rating: 4),
    Review(name: "ليلى خليفة", text: "عباية رائعة و ممتازة وتصميم أنيق عباية رائعة و ممتازة وتصميم أنيق عباية رائعة و ممتازة وتصميم أنيق", image: "profileImage-1", id: 1, rating: 4),
    Review(name: "ليلى خليفة", text: "عباية رائعة و ممتازة وتصميم أنيق", image: "profileImage-1", id: 1, rating: 5),
    Review(name: "ليلى خليفة", text: "عباية رائعة و ممتازة وتصميم أنيقمرررة جميلة وقماشتها راااائعة", image: "profileImage-1", id: 1, rating: 3),
    Review(name: "ليلى خليفة", text: "عباية رائعة و ممتازة وتصميم أنيق", image: "profileImage-1", id: 1, rating: 2),
    Review(name: "ليلى خليفة", text: "عباية رائعة و ممتازة وتصميم أنيق", image: "profileImage-1", id: 1, rating: 4),
    Review(name: "ليلى خليفة", text: "عباية رائعة و ممتازة وتصميم أنيق", image: "profileImage-1", id: 1, rating: 5)]
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
extension ReviewsViewController {
    func setupView(){
        tableView.register(UINib.init(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewTableViewCell")
        tableView.isSelfSize = true
    }
    func localized(){}
    func setupData(){
        tableView.EmptyDataTitle = "لاتوجد تقييمات"
        for obj in productReviews {
            tableView.objects.append(GeneralTableViewData(identifier: "ReviewTableViewCell", object: obj, rowHeight: nil))
        }
    }
    func fetchData(){}
}
